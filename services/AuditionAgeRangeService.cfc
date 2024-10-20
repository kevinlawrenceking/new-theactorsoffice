<cfcomponent displayname="AuditionAgeRangeService" hint="Handles operations for AuditionAgeRange table" output="false" > 
<cffunction name="getvm_audageranges_audageranges_audtion_xref" access="public" returntype="query">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="orderBy" type="string" required="false" default="rangeid">
    
    <cfset var validOrderByColumns = "rangeid,audroleid,rangename">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT rangeid, audroleid, rangename FROM vm_audageranges_audageranges_audtion_xref WHERE 1=1">
    <cfset var whereClause = []>
    
    <!--- Validate ORDER BY clause --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    <cfelse>
        <cfset sql &= " ORDER BY rangeid">
    </cfif>

    <!--- Add conditions to WHERE clause --->
    <cfset arrayAppend(whereClause, "i.valuecategory = 'Tag'")>
    <cfset arrayAppend(whereClause, "i.valuetype = 'Tags'")>
    <cfset arrayAppend(whereClause, "tu.tagtype = 'C'")>
    <cfset arrayAppend(whereClause, "tu.tagname = i.valuetext")>
    <cfset arrayAppend(whereClause, "d.contactid = ?")>

    <!--- Combine WHERE clauses --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Execute the query --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error in getvm_audageranges_audageranges_audtion_xref: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">

            <!--- Return an empty query with correct schema --->
            <cfset queryResult = queryNew("rangeid,audroleid,rangename", "integer,integer,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction></cfcomponent>
