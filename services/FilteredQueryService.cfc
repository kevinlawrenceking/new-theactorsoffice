<cfcomponent displayname="FilteredQueryService" hint="Handles operations for FilteredQuery table" output="false"> 
<cffunction name="getTotalCount" access="public" returntype="query">
    <cfargument name="sIndexColumn" type="string" required="true">
    <cfargument name="conditions" type="struct" required="false" default="#StructNew()#">

    <cfset var result = "">
    <cfset var sql = "SELECT COUNT(#arguments.sIndexColumn#) as total FROM qFiltered">
    <cfset var whereClause = "">
    <cfset var paramList = []>

    <!--- Build WHERE clause dynamically based on conditions --->
    <cfif StructCount(arguments.conditions) gt 0>
        <cfset whereClause = " WHERE ">
        <cfloop collection="#arguments.conditions#" item="key">
            <cfset whereClause &= "#key# = ? AND ">
            <cfset ArrayAppend(paramList, {value=arguments.conditions[key], cfsqltype=determineSQLType(key)})>
        </cfloop>
        <!--- Remove trailing 'AND ' --->
        <cfset whereClause = Left(whereClause, Len(whereClause) - 4)>
    </cfif>

    <!--- Combine SQL with WHERE clause --->
    <cfset sql &= whereClause>

    <!--- Execute query within try/catch for error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#paramList#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="errorLog" text="Error executing query: #cfcatch.message#. SQL: #sql#. Parameters: #SerializeJSON(paramList)#">
            <cfreturn QueryNew("total", "integer")> <!--- Return empty query set --->
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
