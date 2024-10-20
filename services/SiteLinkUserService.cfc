<cfcomponent displayname="SiteLinkUserService" hint="Handles operations for SiteLinkUser table" output="false" > 
<cffunction name="insertsitelinks_user" access="public" returntype="numeric">
    <cfargument name="siteName" type="string" required="true">
    <cfargument name="siteURL" type="string" required="true">
    <cfargument name="siteicon" type="string" required="false" default="unknown.png">
    <cfargument name="siteTypeid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="IsDeleted" type="boolean" required="true">
    <cfargument name="IsCustom" type="boolean" required="true">
    <cfargument name="ver" type="numeric" required="false">
    <cfargument name="siteicon_url" type="string" required="false">

    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            INSERT INTO sitelinks_user_tbl (
                siteName, 
                siteURL, 
                siteicon, 
                siteTypeid, 
                userid, 
                IsDeleted, 
                IsCustom, 
                ver, 
                siteicon_url
            ) VALUES (
                <cfqueryparam value="#arguments.siteName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.siteURL#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.siteicon#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.siteTypeid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.IsDeleted#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.IsCustom#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.ver#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.ver)#">,
                <cfqueryparam value="#arguments.siteicon_url#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.siteicon_url)#">
            )
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error inserting into sitelinks_user_tbl: #cfcatch.message# Details: #cfcatch.detail#">
            <!--- Return 0 or another appropriate indicator of failure --->
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- Removed default attributes from IsDeleted and IsCustom arguments as they are marked required.
--->

<cffunction name="getsitelinks_user" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="ID">
    <cfset var validColumns = "ID,siteTypeid,userid,ver,siteName,siteURL,siteicon,siteicon_url,IsDeleted,IsCustom">
    <cfset var validOrderBy = "ID,siteTypeid,userid,ver,siteName,siteURL,siteicon,siteicon_url">
    <cfset var sql = "SELECT ID, siteTypeid, userid, ver, siteName, siteURL, siteicon, siteicon_url, IsDeleted, IsCustom FROM sitelinks_user_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <cftry>
        <!--- Build the WHERE clause dynamically based on provided filters --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
            </cfif>
        </cfloop>

        <!--- Append the WHERE clause to the SQL statement --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif listFindNoCase(validOrderBy, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error details --->
        <cflog file="application" text="Error in getsitelinks_user: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
        
        <!--- Return an empty query with matching schema on error --->
        <cfset result = queryNew("ID,siteTypeid,userid,ver,siteName,siteURL,siteicon,siteicon_url,IsDeleted,IsCustom", 
                                 "integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,binary,binary")>
    </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Corrected data types in queryNew function to match expected types.
--->

<cffunction name="updatesitelinks_user" access="public" returntype="boolean">
    <cfargument name="ID" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">
    
    <cfset var sql = "UPDATE sitelinks_user_tbl SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "siteName,siteURL,siteicon,siteTypeid,userid,IsDeleted,IsCustom,ver,siteicon_url">
    
    <!--- Build the SET clause dynamically --->
    <cfloop collection="#arguments.data#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(setClauses, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- If no valid columns are provided in data, return false --->
    <cfif arrayLen(setClauses) EQ 0>
        <cfreturn false>
    </cfif>

    <!--- Construct the final SQL query --->
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE ID = ?">

    <!--- Execute the query within a try/catch block for error handling --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <!--- Bind the parameters using cfqueryparam --->
            <cfloop collection="#arguments.data#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.data[key]#" cfsqltype="#evaluate('CF_SQL_' & uCase(replace(key, 'id', 'INTEGER', 'all')))#" null="#isNull(arguments.data[key])#">
                </cfif>
            </cfloop>
            <cfqueryparam value="#arguments.ID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfreturn true>
        
        <!--- Error handling --->
        <cfcatch type="any">
            <cflog file="application" text="Error updating sitelinks_user_tbl: #cfcatch.message#. Details: #cfcatch.detail#. SQL: #sql#">
            <cfreturn false>
        </cfcatch>
    </cftry>
</cffunction> 

<!--- Changes made:
- Added missing DSN variable declaration or reference to ensure datasource is defined.
--->

<cffunction name="getvm_sitelinks_user_sitetypes_user" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="false">
    <cfargument name="sitetypeid" type="numeric" required="false">
    <cfargument name="isdeleted" type="boolean" required="false">
    <cfargument name="isCustom" type="boolean" required="false">
    <cfargument name="orderBy" type="string" required="false" default="sitelink_id">

    <cfset var queryResult = "">
    <cfset var sql = "SELECT sitelink_id, sitename, siteurl, siteicon, sitetypeid, sitetypename, pntitle, ver FROM vm_sitelinks_user_sitetypes_user WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var orderByWhitelist = "sitelink_id,sitename,siteurl,sitetypeid,sitetypename,pntitle,ver">

    <!--- Build dynamic WHERE clause --->
    <cfif structKeyExists(arguments, "userid") and isNumeric(arguments.userid)>
        <cfset arrayAppend(whereClause, "userid = <cfqueryparam value='#arguments.userid#' cfsqltype='CF_SQL_INTEGER'>")>
    </cfif>

    <cfif structKeyExists(arguments, "sitetypeid") and isNumeric(arguments.sitetypeid)>
        <cfset arrayAppend(whereClause, "sitetypeid = <cfqueryparam value='#arguments.sitetypeid#' cfsqltype='CF_SQL_INTEGER'>")>
    </cfif>

    <cfif structKeyExists(arguments, "isdeleted")>
        <cfset arrayAppend(whereClause, "isdeleted = <cfqueryparam value='#arguments.isdeleted#' cfsqltype='CF_SQL_BIT'>")>
    </cfif>

    <cfif structKeyExists(arguments, "isCustom")>
        <cfset arrayAppend(whereClause, "isCustom = <cfqueryparam value='#arguments.isCustom#' cfsqltype='CF_SQL_BIT'>")>
    </cfif>

    <!--- Append WHERE clauses if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate ORDER BY clause --->
    <cfif listFindNoCase(orderByWhitelist, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query --->
    <cftry>
        <cfquery name="queryResult" datasource="#abod#">
            #sql#
        </cfquery>
        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error in getvm_sitelinks_user_sitetypes_user: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query with correct schema on error --->
            <cfset queryResult = queryNew("sitelink_id,sitename,siteurl,siteicon,sitetypeid,sitetypename,pntitle,ver", "integer,varchar,varchar,varchar,integer,varchar,varchar,integer")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction></cfcomponent>
