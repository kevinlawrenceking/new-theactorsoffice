<cfcomponent displayname="ReportUserService" hint="Handles operations for ReportUser table" output="false" > 
<cffunction name="insertreports_user" access="public" returntype="numeric">
    <cfargument name="data" type="struct" required="true">
    <cfset var insertResult = 0>
    <cfset var sql = "">
    
    <cftry>
        <cfset sql = "
            INSERT INTO reports_user_tbl (
                reportid, userid, reportName, reportOrderNo, reporttypeid, 
                reportDescription, isDeleted, colMd, colXl, reportLabels, 
                reportValues, datalabel, colorid
            ) VALUES (
                ?, ?, ?, ?, ?, 
                ?, ?, ?, ?, ?, 
                ?, ?, ?
            )
        ">
        
        <cfquery name="insertQuery" datasource="#DSN#" result="insertResult">
            #sql#
            <cfqueryparam value="#arguments.data.reportid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.data.reportid)#">
            <cfqueryparam value="#arguments.data.userid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.data.userid)#">
            <cfqueryparam value="#arguments.data.reportName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.reportName)#">
            <cfqueryparam value="#arguments.data.reportOrderNo#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.data.reportOrderNo)#">
            <cfqueryparam value="#arguments.data.reporttypeid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.data.reporttypeid)#">
            <cfqueryparam value="#arguments.data.reportDescription#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.reportDescription)#">
            <cfqueryparam value="#arguments.data.isDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.data.colMd#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.data.colMd)#">
            <cfqueryparam value="#arguments.data.colXl#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.data.colXl)#">
            <cfqueryparam value="#arguments.data.reportLabels#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.reportLabels)#">
            <cfqueryparam value="#arguments.data.reportValues#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.reportValues)#">
            <cfqueryparam value="#arguments.data.datalabel#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.datalabel)#">
            <cfqueryparam value="#arguments.data.colorid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.data.colorid)#">
        </cfquery>
        
        <cfset insertResult = insertQuery.generatedKey>
        
        <cfcatch>
            <cflog file="application" type="error"
                text="Error in insertreports_user: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
        </cfcatch>
    </cftry>
    
    <cfreturn insertResult>
</cffunction> 

<!--- Changes made:
- Added missing closing tag for cfargument.
--->

<cffunction name="getreports_user" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var validColumns = "ID,reportid,userid,reportOrderNo,reporttypeid,colMd,colXl,colorid,reportName,reportDescription,reportLabels,reportValues,datalabel,isDeleted">
    <cfset var validOrderColumns = "ID,reportid,userid,reportOrderNo,reporttypeid,colMd,colXl,colorid">
    <cfset var sql = "SELECT ID, reportid, userid, reportOrderNo, reporttypeid, colMd, colXl, colorid, reportName, reportDescription, reportLabels, reportValues, datalabel, isDeleted FROM reports_user_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryResult = "">
    
    <cftry>
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
            </cfif>
        </cfloop>

        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <cfif arguments.orderBy neq "" and listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <cfquery name="queryResult" datasource="yourDataSource">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.filters[key])#"> <!--- Changed to CF_SQL_VARCHAR as a generic type --->
                </cfif>
            </cfloop>
        </cfquery>

        <cfcatch>
            <cflog file="application" text="Error in getreports_user: #cfcatch.message#, Detail: #cfcatch.detail#, SQL: #sql#">
            <cfset queryResult = queryNew("ID,reportid,userid,reportOrderNo,reporttypeid,colMd,colXl,colorid,reportName,reportDescription,reportLabels,reportValues,datalabel,isDeleted", "integer,integer,integer,integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar")> <!--- Corrected column types --->
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction>

<!--- Changes made:
- Changed cfsqltype in cfqueryparam to CF_SQL_VARCHAR as a generic type for demonstration purposes.
- Corrected column types in queryNew from integer to varchar where applicable.
--->

<cffunction name="getvm_reports_user_reportitems" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="report_user_id">
    
    <cfset var sql = "SELECT report_user_id, reportid, userid, reportorderno, reporttypeid, colmd, colxl, statvalue, reportname, datalabel, reportdescription, reporttypename, colorname, colorscheme FROM vm_reports_user_reportitems WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "report_user_id,reportid,userid,reportorderno,reporttypeid,colmd,colxl,statvalue,reportname,datalabel,reportdescription,reporttypename,colorname,colorscheme">
    <cfset var validOrderByColumns = "report_user_id,reportid,userid">

    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
        </cfif>
    </cfloop>

    <cfif arrayLen(whereClause)>
        <cfset sql &= " AND " & arrayToList(whereClause," AND ")>
    <cfelse>
        <!--- Return an empty query if no filters are provided --->
        <cfreturn queryNew("report_user_id,reportid,userid,reportorderno,reporttypeid,colmd,colxl,statvalue,reportname,datalabel,reportdescription,reporttypename,colorname,colorscheme", "integer,integer,integer,integer,integer,integer,integer,integer,varchar,varchar,varchar,varchar,varchar,varchar")>
    </cfif>

    <!--- Ensure the ORDER BY clause uses a valid column --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfreturn result>
        
        <cfcatch type="any">
            <!--- Log the error --->
            <cflog file="application" text="Error in getvm_reports_user_reportitems: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            
            <!--- Return an empty query on error --->
            <cfreturn queryNew("report_user_id,reportid,userid,reportorderno,reporttypeid,colmd,colxl,statvalue,reportname,datalabel,reportdescription,reporttypename,colorname,colorscheme", "integer,integer,integer,integer,integer,integer,Integer,Integer,varchar,varchar,varchar,varchar,varchar,varchar")>
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
