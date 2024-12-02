<cfscript>
    // Get the first part of the server name (subdomain)
    host = ListFirst(cgi.server_name, ".");

    // Determine the datasource based on the host
    if (host == "app" || host == "uat") {
        datasourceName = "abo";
        dsn = "abo";
    } else {
        datasourceName = "abod";
        dsn = "abod";
    }
</cfscript>

<!--- Dynamically use the determined datasource in the cfapplication tag --->
<cfapplication 
    name="TAO_dev" 
    sessionmanagement="true" 
    applicationtimeout="#createTimeSpan(1, 0, 0, 0)#" 
    sessiontimeout="#createTimeSpan(0, 1, 0, 0)#" 
    datasource="#datasourceName#"
    setclientcookies="true"
>

<cfinclude template="/include/qry/fetchUsers.cfm" />

<cfif structKeyExists(variables, "userid")>
    <cfscript>
        session.userMediaPath = application.baseMediaPath & "\users\" & session.userID;
        session.userMediaUrl = application.baseMediaUrl & "/users/" & session.userID;

        session.userCalendarPath = session.userMediaPath;
        session.userCalendarUrl = "https://" & host & ".theactorsoffice.com/" & session.userMediaUrl;

        session.userContactsPath = session.userMediaPath & "\contacts";
        session.userContactsUrl = session.userMediaUrl & "/contacts";

        session.userImportsPath = session.userMediaPath & "\imports";
        session.userImportsUrl = session.userMediaUrl & "/imports";

        session.userExportsPath = session.userMediaPath & "\exports";
        session.userExportsUrl = session.userMediaUrl & "/exports";

        session.userSharePath = session.userMediaPath & "\share";
        session.userShareUrl = session.userMediaUrl & "/share";

        session.userAvatarPath = session.userMediaPath & "\avatar.jpg";
        session.userAvatarUrl = session.userMediaUrl & "/avatar.jpg";
    </cfscript>

    <!--- Handle contactid if defined --->
    <cfif structKeyExists(variables, "contactid")>
        <cfscript>
            defaultavatarurl = session.userContactsUrl & "/" & contactid & "/avatar.jpg";
        </cfscript>
    </cfif>

    <!--- Handle currentid if defined --->
    <cfif structKeyExists(variables, "currentid")>
        <cfscript>
            defaultavatarurl = session.userContactsUrl & "/" & currentid & "/avatar.jpg";
        </cfscript>
    </cfif>
</cfif>
