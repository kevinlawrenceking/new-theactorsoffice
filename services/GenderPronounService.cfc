<cfcomponent displayname="GenderPronounService" hint="Handles operations for GenderPronoun table" output="false"> 
<cffunction name="getGenderPronouns" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    <cfset var result = "">
    <cfset var sql = "SELECT genderpronoun, genderpronounplural FROM genderpronouns">
    <cfset var whereClauses = []>
    <cfset var params = []>

    <!--- Validate and construct WHERE clause --->
    <cfloop collection="#arguments.conditions#" item="key">
        <cfif listFindNoCase("genderpronoun,genderpronounplural", key)>
            <cfset arrayAppend(whereClauses, "#key# = ?")>
            <cfset arrayAppend(params, {value=arguments.conditions[key], cfsqltype="CF_SQL_VARCHAR"})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clauses if any --->
    <cfif arrayLen(whereClauses) gt 0>
        <cfset sql &= " WHERE " & arrayToList(whereClauses, " AND ")>
    </cfif>

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error executing getGenderPronouns: #cfcatch.message# SQL: #sql# Parameters: #serializeJSON(params)#">
            <cfreturn queryNew("genderpronoun,genderpronounplural", "varchar,varchar")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
