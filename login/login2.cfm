 <cfapplication name="TAO" sessionmanagement="true">

<!--- 
<cfscript>
    host = ListFirst(cgi.server_name, ".");
    if (host == "app" || host == "uat") {
        datasourceName = "abo";
        dsn = "abo";
    } else {
        datasourceName = "abod";
        dsn = "abod";
    }
</cfscript>
<cfset userid = 0 />
<cfif #isdefined('cookie.userid')# > 
    
 <cfset StructDelete(cookie, "userid")>
     
    </cfif>  

<cfif #isdefined('session.userid')# > 
    
 <cfset StructDelete(Session, "userid")>
     
    </cfif>  
<cfparam name="j_password" default="" />
<cfparam name="j_username" default="" />

<cfquery result="result" name="insert" datasource="#dsn#">
    INSERT INTO loggins (u, p, REMOTE_ADDR, HTTP_USER_AGENT) 
    VALUES (
        <cfqueryparam value="#j_username#" cfsqltype="cf_sql_varchar" />, 
        <cfqueryparam value="#j_password#" cfsqltype="cf_sql_varchar" />,
        <cfqueryparam value="#cgi.REMOTE_ADDR#" cfsqltype="cf_sql_varchar" />, 
        <cfqueryparam value="#cgi.HTTP_USER_AGENT#" cfsqltype="cf_sql_varchar" />
    );
</cfquery>

<!--- Query to authenticate the user --->
<cfquery result="result" name="loginQuery" datasource="#dsn#" maxrows="1">
    SELECT 
        u.userid,
        u.passwordHash,
        u.passwordSalt,
        us.status_url
    FROM 
        taousers u
    INNER JOIN 
        userstatuses us ON us.userstatus = u.userstatus
    WHERE 
        u.userEmail = <cfqueryparam value="#j_username#" cfsqltype="cf_sql_varchar" />
</cfquery>

<!--- Check if the user exists --->
<cfif loginQuery.recordcount eq 1>
    <!--- Hash the provided password with the stored salt --->
<cfset userpassword2 = Hash(form.j_password & loginQuery.passwordSalt, "SHA-512") /> 

    <!--- Validate the password --->
  <cfif loginQuery.passwordHash eq userpassword2> 
        <!--- Set the session variable ---> 
        <cfset userid = loginQuery.userid />
        <cfset session.userid = loginQuery.userid />    
        <cfoutput>userid: #userid# / session userid: #session.userid#</cfoutput>   
        <!--- Redirect to the user's status URL --->
     
        <cflocation url="#loginQuery.status_url#" addtoken="false" />
    </cfif>
     
       
    </cfif>
<cfif #isdefined('session.userid')# > 
    
 <cfset StructDelete(Session, "userid")>
     
    </cfif>  
 <cflocation url="/loginform.cfm?pwrong=Y" addtoken="false" />


--->









 <cfapplication name="TAO" sessionmanagement="true">

<cfscript>
    host = ListFirst(cgi.server_name, ".");
    if (host == "app" || host == "uat") {
        datasourceName = "abo";
        dsn = "abo";
    } else {
        datasourceName = "abod";
        dsn = "abod";
    }
</cfscript>

<!--- Ensure session starts --->
<cfif NOT structKeyExists(session, "userid")>
    <cfset session.userid = 0>
</cfif>

<!--- Debug session before login --->
<cfdump var="#session#" label="Session Before Login">

<!--- Process Login --->
<cfquery name="loginQuery" datasource="#dsn#" maxrows="1">
    SELECT 
        u.userid,
        u.passwordHash,
        u.passwordSalt,
        us.status_url
    FROM 
        taousers u
    INNER JOIN 
        userstatuses us ON us.userstatus = u.userstatus
    WHERE 
        u.userEmail = <cfqueryparam value="#form.j_username#" cfsqltype="cf_sql_varchar">
</cfquery>

<cfif loginQuery.recordcount eq 1>
    <cfset userpassword2 = Hash(form.j_password & loginQuery.passwordSalt, "SHA-512")> 

    <cfif loginQuery.passwordHash eq userpassword2> 
        <cfset session.userid = loginQuery.userid>
        <cfset session.userLoggedIn = true>

        <!--- Debug session after setting user ID --->
        <cfdump var="#session#" label="Session After Login">
        
        <cflocation url="#loginQuery.status_url#" addtoken="false">
    </cfif>
</cfif>

<!--- Redirect to login form if authentication fails --->
<cflocation url="/loginform.cfm?pwrong=Y" addtoken="false">
