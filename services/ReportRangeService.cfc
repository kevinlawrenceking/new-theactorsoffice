<cfcomponent displayname="ReportRangeService" hint="Handles operations for ReportRange table" output="false"> 

<cffunction name="SELreportranges" access="public" returntype="query">
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

<cffunction name="UPDreportranges" access="public" returntype="void">
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

<cffunction name="UPDreportranges_24221" access="public" returntype="void">
    <cfargument name="customStart" type="date" required="true">
    <cfargument name="customEnd" type="date" required="true">

    <cfquery result="result">
        UPDATE reportranges 
        SET rangestart = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.customStart#" />, 
            rangeend = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.customEnd#" />
        WHERE rangename = 'Custom'
    </cfquery>

</cffunction>

<cffunction name="SELreportranges_24229" access="public" returntype="query">
    <cfargument name="new_rangeid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT rangeid, rangename, rangestart, rangeend
        FROM reportranges
        WHERE rangeid = <cfqueryparam value="#arguments.new_rangeid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cfscript>
function getReportRanges(required struct params) {
    var result = queryNew("rangeid, rangename, rangestart, rangeend", "integer,varchar,timestamp,timestamp");
    var sql = "SELECT rangeid, rangename, rangestart, rangeend FROM reportranges WHERE 1=1";
    var conditions = [];
    var paramValues = [];

    var validColumns = ["rangeid", "rangename", "rangestart", "rangeend"];

    for (var key in params) {
        if (listFindNoCase(validColumns, key)) {
            arrayAppend(conditions, "#key# = ?");
            arrayAppend(paramValues, {value=params[key], type=getCFSQLType(key)});
        }
    }

    if (arrayLen(conditions) > 0) {
        sql &= " AND " & arrayToList(conditions, " AND ");
    } else {
        return result;
    }

    result = queryExecute(
        sql,
        paramValues
    );

    return result;
}

function getCFSQLType(columnName) {
    switch (columnName) {
        case "rangeid":
            return "CF_SQL_INTEGER";
        case "rangename":
            return "CF_SQL_VARCHAR";
        case "rangestart":
        case "rangeend":
            return "CF_SQL_TIMESTAMP";
        default:
            return "CF_SQL_VARCHAR";
    }
}
</cfscript>

</cfcomponent>