<cfcomponent displayname="PanelsMasterService" hint="Handles operations for PanelsMaster table" output="false"> 
<cffunction name="SELpgpanels_master" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT * FROM pgpanels_master">
    <cfset var whereClauses = []>
    <cfset var parameters = []>

    <!--- Validate and build WHERE clauses --->
    <cfloop collection="#arguments.conditions#" item="columnName">
        <cfif listFindNoCase("validColumn1,validColumn2,validColumn3", columnName)>
            <cfset arrayAppend(whereClauses, "#columnName# = ?")>
            <cfset arrayAppend(parameters, {value=arguments.conditions[columnName], cfsqltype=determineSQLType(columnName)})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clauses if any --->
    <cfif arrayLen(whereClauses) gt 0>
        <cfset sql &= " WHERE " & arrayToList(whereClauses, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause if needed --->
    <!--- Assuming 'validOrderColumn' is a valid column for ordering --->
    <cfset sql &= " ORDER BY validOrderColumn">

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop array="#parameters#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error executing query: #cfcatch.message# SQL: #sql# Parameters: #serializeJSON(parameters)#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction></cfcomponent>
