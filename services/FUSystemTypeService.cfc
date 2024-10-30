<cfcomponent displayname="FUSystemTypeService" hint="Handles operations for FUSystemType table" output="false"> 
<cffunction name="SELfusystemtypes" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT systemtype AS ID, systemtype AS systemname FROM fusystemtypes">
    <cfset var whereClause = "">
    <cfset var paramList = []>

    <!--- Build WHERE clause dynamically based on conditions argument --->
    <cfif structCount(arguments.conditions) gt 0>
        <cfset whereClause = " WHERE ">
        <cfloop collection="#arguments.conditions#" item="key">
            <cfset whereClause &= "#key# = ? AND ">
            <cfset arrayAppend(paramList, {value=arguments.conditions[key], cfsqltype=determineSQLType(key)})>
        </cfloop>
        <!--- Remove trailing 'AND ' --->
        <cfset whereClause = left(whereClause, len(whereClause) - 5)>
    </cfif>

    <!--- Append ORDER BY clause --->
    <cfset sql &= whereClause & " ORDER BY systemtype">

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop array="#paramList#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error executing getSystemTypes: #cfcatch.message# SQL: #sql# Parameters: #serializeJSON(paramList)#">
            <cfreturn queryNew("ID,systemname")>
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction></cfcomponent>
