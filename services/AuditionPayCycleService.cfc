<cfcomponent displayname="AuditionPayCycleService" hint="Handles operations for AuditionPayCycle table" output="false" > 
<cffunction name="getaudpaycycles" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="paycycleid">
    <cfset var result = "">
    <cfset var sql = "SELECT paycycleid, paycyclename FROM audpaycycles WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "paycycleid,paycyclename">
    <cfset var validOrderColumns = "paycycleid,paycyclename">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause to SQL if conditions exist --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#iif(key eq 'paycycleid', 'CF_SQL_INTEGER', 'CF_SQL_VARCHAR')#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error --->
            <cflog file="application" text="Error in getaudpaycycles: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query on error --->
            <cfreturn queryNew("paycycleid,paycyclename", "integer,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- Removed unnecessary cfelse block that returned an empty query if no filters were provided.
--->
</cfcomponent>
