<cfcomponent displayname="TicketPriorityService" hint="Handles operations for TicketPriority table" output="false"> 
<cffunction name="getTicketPriorities" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    
    <cfset var queryResult = "">
    <cfset var sql = "SELECT ticketpriority AS id, ticketpriority AS name FROM ticketpriority">
    <cfset var whereClause = []>
    <cfset var orderByClause = " ORDER BY orderNo">
    
    <cftry>
        <!--- Build WHERE clause dynamically based on arguments --->
        <cfif structCount(arguments.conditions)>
            <cfloop collection="#arguments.conditions#" item="key">
                <cfset arrayAppend(whereClause, "#key# = :#key#")>
            </cfloop>
            <cfset sql &= " WHERE " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Append ORDER BY clause --->
        <cfset sql &= orderByClause>

        <!--- Execute the query --->
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.conditions#" item="key">
                <cfqueryparam value="#arguments.conditions[key]#" cfsqltype="CF_SQL_VARCHAR" />
            </cfloop>
        </cfquery>

        <!--- Return the result --->
        <cfreturn queryResult>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="Error executing getTicketPriorities: #cfcatch.message# SQL: #sql# Params: #serializeJSON(arguments.conditions)#"/>
        <!--- Return an empty query --->
        <cfreturn queryNew("id,name", "varchar,varchar")>
    </cfcatch>
    </cftry>
</cffunction></cfcomponent>
