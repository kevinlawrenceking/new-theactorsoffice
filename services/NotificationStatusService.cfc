<cfcomponent displayname="NotificationStatusService" hint="Handles operations for NotificationStatus table" output="false" > 
<cffunction name="getnotstatuses" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="notID">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT `notID`, `actionID`, `userID`, `suID`, `systemID`, `contactID`, `actionNo`, `actionDaysNo`, `actionDaysRecurring`, `actionlinkid`, `notStatus`, `notNotes`, `suStatus`, `actionDetails`, `actionTitle`, `navToURL`, `actionNotes`, `actionInfo`, `BtnName`, `ActionLinkURL`, `endlink`, `targetlink`, `checktype`, `delstart`, `delend`, `status_color`, `ispastdue`, `notTimeStamp`, `suTimeStamp`, `notStartDate`, `notEndDate`, `suStartDate`, `suEndDate`, `suNotes` FROM vm_notstatuses_funotifications_fuactions WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validOrderByColumns = "notID, actionID, userID, suID, systemID, contactID, actionNo, actionDaysNo, actionDaysRecurring, actionlinkid, notStatus, notNotes, suStatus, actionDetails, actionTitle, navToURL, actionNotes, actionInfo, BtnName, ActionLinkURL, endlink, targetlink, checktype, delstart, delend, status_color, ispastdue, notTimeStamp, suTimeStamp, notStartDate, notEndDate, suStartDate, suEndDate">

    <cftry>
        <!--- Add conditions based on filters --->
        <cfif structKeyExists(arguments.filters, "userid")>
            <cfset arrayAppend(whereClause, "userID = ?")>
        </cfif>

        <!--- Example of hardcoded conditions --->
        <cfset arrayAppend(whereClause, "read = 0")>
        <cfset arrayAppend(whereClause, "trash = 0")>

        <!--- Append dynamic where clauses --->
        <cfloop array="#whereClause#" index="condition">
            <cfset sql &= " AND " & condition>
        </cfloop>

        <!--- Validate and append ORDER BY clause --->
        <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY " & arguments.orderBy>
        </cfif>

        <!--- Execute the query --->
        <cfquery name="queryResult" datasource="yourDataSource">
            #sql#
            <cfif structKeyExists(arguments.filters, "userid")>
                <cfqueryparam value="#arguments.filters.userid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.filters.userid)#">
            </cfif>
        </cfquery>

    <cfcatch>
        <!--- Log error details --->
        <cflog file="application" text="Error in getnotstatuses: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">

        <!--- Return an empty query with the correct structure on error --->
        <cfset queryResult = queryNew("notID,int|actionID,int|userID,int|suID,int|systemID,int|contactID,int|actionNo,int|actionDaysNo,int|actionDaysRecurring,int|actionlinkid,int|notStatus,varchar|notNotes,varchar|suStatus,varchar|actionDetails,varchar|actionTitle,varchar|navToURL,varchar|actionNotes,varchar|actionInfo,varchar|BtnName,varchar|ActionLinkURL,varchar|endlink,varchar|targetlink,varchar|checktype,varchar|delstart,varchar|delend,varchar|status_color,varchar|ispastdue,int|notTimeStamp,timestamp|suTimeStamp,timestamp|notStartDate,date|notEndDate,date|suStartDate,date|suEndDate,date|suNotes,longvarchar")>
    </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction> 

<!--- Changes made:
- None. The provided code does not contain syntax errors that would prevent execution.
--->
</cfcomponent>
