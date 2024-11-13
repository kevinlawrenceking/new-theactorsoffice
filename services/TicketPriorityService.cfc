<cfcomponent displayname="TicketPriorityService" hint="Handles operations for TicketPriority table" > 
<cffunction output="false" name="SELticketpriority" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    
    <cfset var queryResult = "">
    <cfset var sql = "SELECT ticketpriority AS id, ticketpriority AS name FROM ticketpriority">
    <cfset var whereClause = []>
    <cfset var orderByClause = " ORDER BY orderNo">
    
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
    <cfquery result="result" name="queryResult">
        #sql#
        <cfloop collection="#arguments.conditions#" item="key">
            <cfqueryparam value="#arguments.conditions[key]#" cfsqltype="CF_SQL_VARCHAR" />
        </cfloop>
    </cfquery>

    <!--- Return the result --->
    <cfreturn queryResult>

</cffunction></cfcomponent>