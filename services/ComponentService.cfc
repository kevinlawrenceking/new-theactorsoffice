<cfcomponent displayname="ComponentService" hint="Handles operations for Component table" output="false" > 
<cffunction name="getpgcomps" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT compID, appID, menuOrder, compName, compIcon, compDir, compTable, compInner, compRecordName, recordname, service, IsDeleted, compOwner, menuYN, compActive FROM pgcomps_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "compID,appID,menuOrder,compName,compIcon,compDir,compTable,compInner,compRecordName,recordname,service,IsDeleted,compOwner,menuYN,compActive">
    <cfset var validOrderByColumns = "compID,appID,menuOrder">


    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>


    <cfif len(trim(arguments.orderBy)) and listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate('CF_SQL_' & uCase(listGetAt(validColumns & ',', listFindNoCase(validColumns & ',', key))) )#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getpgcomps: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">

            <cfset queryResult = queryNew("compID,appID,menuOrder,compName,compIcon,compDir,compTable,compInner,compRecordName,recordname,service,IsDeleted,compOwner,menuYN,compActive", "integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,binary,char,char")>
        </cfcatch>
    </cftry>


    <cfreturn queryResult>
</cffunction> 


</cfcomponent>
