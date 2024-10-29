<cfcomponent displayname="ReportColorService" hint="Handles operations for ReportColor table" output="false"> 
<cffunction name="getReportColors" access="public" returntype="query">
    <cfargument name="colorName" type="string" required="false">
    
    <cfset var result = "">
    <cfset var sql = "SELECT colorid, colorname, colorscheme FROM reportcolors">
    <cfset var whereClause = "">
    <cfset var params = []>

    <cfif structKeyExists(arguments, "colorName") and len(trim(arguments.colorName))>
        <cfset whereClause = " WHERE colorname = ?">
        <cfset arrayAppend(params, {value=arguments.colorName, cfsqltype="CF_SQL_VARCHAR"})>
    </cfif>

    <cfset sql &= whereClause & " ORDER BY colorname">

    <cftry>
        <cfquery name="result" datasource="yourDatasource">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error executing query in getReportColors: #cfcatch.message#">
            <cfreturn queryNew("colorid,colorname,colorscheme", "integer,varchar,varchar")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
