<cfcomponent displayname="IncomeTypeService" hint="Handles operations for IncomeType table" output="false"> 
<cffunction name="SELincometypes" access="public" returntype="query">
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

    <!--- Execute query --->
    <cfquery name="result">
        #sql#
        <cfloop array="#paramValues#" index="param">
            <cfquery result="result" param value="#param.value#" cfsqltype="#param.cfsqltype#">
        </cfloop>
    </cfquery>

    <cfreturn result>
</cffunction></cfcomponent>