<cfcomponent displayname="PageAppLinkService" hint="Handles operations for PageAppLink table" output="false" > 
<cffunction name="getpgapplinks" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="linkid">
    
    <cfset var sql = "SELECT linkid, link_no, linkurl, linkname, linktype, pluginname, rel, hrefid, linkloc_tb FROM vm_pgapplinks_pgplugins_pgpages WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "linkid,link_no,linkurl,linkname,linktype,pluginname,rel,hrefid,linkloc_tb">
    <cfset var validOrderColumns = "linkid,link_no,linkurl,linkname,linktype,pluginname">

    <!--- Build WHERE clause dynamically based on filters --->
    <cfif structKeyExists(arguments.filters, "linkid")>
        <cfset arrayAppend(whereClause, "linkid = ?")>
        <cfset arrayAppend(queryParams, {value=arguments.filters.linkid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments.filters, "pluginname")>
        <cfset arrayAppend(whereClause, "pluginname = ?")>
        <cfset arrayAppend(queryParams, {value=arguments.filters.pluginname, cfsqltype="CF_SQL_VARCHAR"})>
    </cfif>

    <!--- Additional conditions can be added similarly --->

    <!--- Append WHERE clauses if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        
        <cfreturn result>

        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getpgapplinks: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">

            <!--- Return an empty query with correct schema --->
            <cfreturn queryNew("linkid,link_no,linkurl,linkname,linktype,pluginname,rel,hrefid,linkloc_tb", 
                               "integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,char")>
        </cfcatch>
    </cftry>
</cffunction> 

<!--- Changes made:
     - None. The code is syntactically correct.
--->
</cfcomponent>
