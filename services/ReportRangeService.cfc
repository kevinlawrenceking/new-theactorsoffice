<cfcomponent displayname="ReportRangeService" hint="Handles operations for ReportRange table" > 

<cffunction output="false" name="SELreportranges" access="public" returntype="query">
    <cfargument name="excludedRangeIds" type="array" required="true">
    <cfset var qryResult = "">

    <cfquery result="result" name="qryResult">
        SELECT rangeid, rangename, rangestart, rangeend
        FROM reportranges
        WHERE rangeid NOT IN (
            <cfloop array="#arguments.excludedRangeIds#" index="rangeId">
                <cfqueryparam value="#rangeId#" cfsqltype="CF_SQL_INTEGER" />
                <cfif rangeId neq arrayLen(arguments.excludedRangeIds)>,</cfif>
            </cfloop>
        )
    </cfquery>

    <cfreturn qryResult>
</cffunction>

<cffunction output="false" name="UPDreportranges" access="public" returntype="void">
    <cfargument name="new_rangestart" type="date" required="true">
    <cfargument name="new_rangeend" type="date" required="true">
    <cfargument name="current_rangeid" type="numeric" required="true">

    <cfquery result="result">
        UPDATE reportranges 
        SET rangestart = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.new_rangestart#" />, 
            rangeend = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.new_rangeend#" />
        WHERE rangeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.current_rangeid#" />
    </cfquery>

</cffunction>

<cffunction output="false" name="UPDreportranges_24221" access="public" returntype="void">
    <cfargument name="customStart" type="date" required="true">
    <cfargument name="customEnd" type="date" required="true">

    <cfquery result="result">
        UPDATE reportranges 
        SET rangestart = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.customStart#" />, 
            rangeend = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.customEnd#" />
        WHERE rangename = 'Custom'
    </cfquery>

</cffunction>

<cffunction output="false" name="SELreportranges_24229" access="public" returntype="query">
    <cfargument name="new_rangeid" type="numeric" required="true">
    
    

    <cfquery name="result">
        SELECT rangeid, rangename, rangestart, rangeend
        FROM reportranges
        WHERE rangeid = <cfqueryparam value="#arguments.new_rangeid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="getReportRanges" access="public" returntype="query" output="false">
    <cfargument name="params" type="struct" required="true">

    <cfset var result = queryNew("rangeid, rangename, rangestart, rangeend", "integer,varchar,timestamp,timestamp")>
    <cfset var sql = "SELECT rangeid, rangename, rangestart, rangeend FROM reportranges WHERE 1=1">
    <cfset var conditions = []>
    <cfset var paramValues = []>
    <cfset var validColumns = "rangeid,rangename,rangestart,rangeend">


    <cfloop collection="#arguments.params#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(conditions, key & " = ?")>
            <cfset arrayAppend(paramValues, {value=arguments.params[key], cfsqltype=getCFSQLType(key)})>
        </cfif>
    </cfloop>


    <cfif arrayLen(conditions) GT 0>
        <cfset sql &= " AND " & arrayToList(conditions, " AND ")>
    <cfelse>
        <cfreturn result>
    </cfif>


    <cfquery name="result">
        #sql#
        <cfloop array="#paramValues#" index="param">
            <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
        </cfloop>
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="getCFSQLType" access="public" returntype="string" output="false">
    <cfargument name="columnName" type="string" required="true">

    <cfif arguments.columnName EQ "rangeid">
        <cfreturn "CF_SQL_INTEGER">
    <cfelseif arguments.columnName EQ "rangename">
        <cfreturn "CF_SQL_VARCHAR">
    <cfelseif arguments.columnName EQ "rangestart" OR arguments.columnName EQ "rangeend">
        <cfreturn "CF_SQL_TIMESTAMP">
    <cfelse>
        <cfreturn "CF_SQL_VARCHAR">
    </cfif>
</cffunction>


</cfcomponent>