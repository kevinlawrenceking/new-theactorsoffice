<cfcomponent displayname="IncomeTypeService" hint="Handles operations for IncomeType table" output="false"> 
<cffunction name="getIncomeTypes" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    <cfset var result = "">
    <cfset var sql = "SELECT incometypeid AS id, incometype AS name FROM incometypes">
    <cfset var whereClause = []>
    <cfset var paramValues = []>
    
    <!--- Build WHERE clause dynamically based on provided conditions --->
    <cfloop collection="#arguments.conditions#" item="key">
        <cfif listFindNoCase("id,name", key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(paramValues, {value=arguments.conditions[key], cfsqltype=key EQ "id" ? "CF_SQL_INTEGER" : "CF_SQL_VARCHAR"})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause if conditions exist --->
    <cfif arrayLen(whereClause) GT 0>
        <cfset sql &= " WHERE " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#paramValues#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getIncomeTypes: #cfcatch.message#, SQL: #sql#, Params: #serializeJSON(paramValues)#">
            <cfthrow message="Database error occurred while fetching income types." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
