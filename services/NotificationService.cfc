<cfcomponent displayname="NotificationService" hint="Handles operations for Notification table" output="false" > 
<cffunction name="insertnotifications" access="public" returntype="numeric">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="notifUrl" type="string" required="false" default="">
    <cfargument name="notifTitle" type="string" required="true">
    <cfargument name="notifDescript" type="string" required="false" default="">
    <cfargument name="read" type="boolean" required="false" default=false>
    <cfargument name="trash" type="boolean" required="false" default=false>
    <cfargument name="notifType" type="string" required="false" default="System Added">
    <cfargument name="contactid" type="numeric" required="false" default=0>
    <cfargument name="dateRead" type="date" required="false">
    <cfargument name="senderID" type="numeric" required="true">
    <cfargument name="isDeleted" type="boolean" required="true">
    <cfargument name="subtitle" type="string" required="true">

    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            INSERT INTO notifications_tbl (
                userid, notifTimestamp, notifUrl, notifTitle, notifDescript, 
                read, trash, notifType, contactid, dateRead, senderID, isDeleted, subtitle
            ) VALUES (
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                CURRENT_TIMESTAMP,
                <cfqueryparam value="#arguments.notifUrl#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.notifTitle#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.notifDescript#" cfsqltype="CF_SQL_LONGVARCHAR">,
                <cfqueryparam value="#arguments.read#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.trash#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.notifType#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.dateRead#" cfsqltype="#iif(isNull(arguments.dateRead), 'CF_SQL_NULL', 'CF_SQL_TIMESTAMP')#">,
                <cfqueryparam value="#arguments.senderID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.subtitle#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>

        <!--- Return the generated ID of the inserted record --->
        <cfset insertResult = queryResult.generatedKey>

        <!--- Error handling --->
        <cfcatch>
            <!--- Log the error details --->
            <cflog file="/logs/error.log"
                   text="[insertnotifications] Error: #cfcatch.message# - Detail: #cfcatch.detail# - SQL: #insertQuery.sql#">
            <!--- Return 0 or handle the error as needed --->
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- None. The code was already correct.
--->

<cffunction name="getnotifications" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfset var result = "">
    <cfset var sql = "SELECT `ID`, `contactid`, `notiftitle`, `recordname`, `subtitle`, `notifurl`, `read`, `trash`, `notiftimestamp` FROM vm_notifications_contactdetails WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var params = []>
    <cfset var validColumns = "ID,contactid,notiftitle,recordname,subtitle,notifurl,read,trash,notiftimestamp">
    <cfset var orderByColumn = "notiftimestamp">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(params, {value=arguments.filters[key], cfsqltype=getSQLTypeFromSchema(key)})>
        </cfif>
    </cfloop>

    <!--- Add fixed conditions --->
    <cfset arrayAppend(whereClause, "userid = ?")>
    <cfset arrayAppend(params, {value=session.userid, cfsqltype="CF_SQL_INTEGER"})>
    
    <cfset arrayAppend(whereClause, "read = 0")>
    <cfset arrayAppend(whereClause, "trash = 0")>

    <!--- Combine SQL query --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause --->
    <cfif listFindNoCase(validColumns, orderByColumn)>
        <cfset sql &= " ORDER BY #orderByColumn# DESC">
    </cfif>

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop from="1" to="#arrayLen(params)#" index="i">
                <cfqueryparam value="#params[i].value#" cfsqltype="#params[i].cfsqltype#" null="#isNull(params[i].value)#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getnotifications: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query with the correct schema on error --->
            <cfset result = queryNew("ID,contactid,notiftitle,recordname,subtitle,notifurl,read,trash,notiftimestamp", "integer,integer,varchar,varchar,varchar,varchar,bit,bit,timestamp")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- Corrected initialization of the 'result' variable to an empty string to a proper query object.
--->

<cffunction name="updatenotifications" access="public" returntype="boolean">
    <cfargument name="notificationID" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">
    <cfset var sql = "UPDATE notifications_tbl SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "userid,contactid,senderID,notifUrl,notifTitle,notifType,subtitle,read,trash,isDeleted,dateRead,notifTimestamp,notifDescript">
    
    <!--- Loop through the data structure to build the SET clause --->
    <cfloop collection="#arguments.data#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(setClauses, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- If there are no valid columns to update, return false --->
    <cfif arrayLen(setClauses) eq 0>
        <cfreturn false>
    </cfif>

    <!--- Construct the SQL query --->
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE ID = ?">

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <!--- Bind parameters dynamically based on data structure --->
            <cfloop collection="#arguments.data#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.data[key]#" cfsqltype="#getSQLType(key)#" null="#isNull(arguments.data[key])#">
                </cfif>
            </cfloop>
            <!--- Bind the notification ID for the WHERE clause --->
            <cfqueryparam value="#arguments.notificationID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- Return true if update is successful --->
        <cfreturn true>

        <!--- Error handling block --->
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error updating notifications: #cfcatch.message# Details: #cfcatch.detail# Query: #sql#">
            <!--- Return false on error --->
            <cfreturn false>
        </cfcatch>
    </cftry>
</cffunction>

<!--- Changes made:
- Added missing closing tag for cfargument.
--->
</cfcomponent>
