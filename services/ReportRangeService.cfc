<cfcomponent displayname="ReportRangeService" hint="Handles operations for ReportRange table" output="false"> 
<cffunction name="getReportRanges" access="public" returntype="query">
    <cfargument name="excludedRangeIds" type="array" required="true">
    <cfset var qryResult = "">
    <cftry>
        <cfquery name="qryResult" datasource="abod">
            SELECT rangeid, rangename, rangestart, rangeend
            FROM reportranges
            WHERE rangeid NOT IN (
                <cfloop array="#arguments.excludedRangeIds#" index="rangeId">
                    <cfqueryparam value="#rangeId#" cfsqltype="CF_SQL_INTEGER" />
                    <cfif rangeId neq arrayLen(arguments.excludedRangeIds)>,</cfif>
                </cfloop>
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getReportRanges: #cfcatch.message# Query: SELECT rangeid, rangename, rangestart, rangeend FROM reportranges WHERE rangeid NOT IN (1, 7)">
            <cfreturn queryNew("rangeid,rangename,rangestart,rangeend", "integer,varchar,date,date")>
        </cfcatch>
    </cftry>
    <cfreturn qryResult>
</cffunction>
<cffunction name="updateReportRanges" access="public" returntype="void">
    <cfargument name="new_rangestart" type="date" required="true">
    <cfargument name="new_rangeend" type="date" required="true">
    <cfargument name="current_rangeid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE reportranges 
            SET rangestart = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.new_rangestart#" />, 
                rangeend = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.new_rangeend#" />
            WHERE rangeid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.current_rangeid#" />
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating report ranges: #cfcatch.message# - Query: UPDATE reportranges SET rangestart, rangeend WHERE rangeid = #arguments.current_rangeid#" />
            <cfthrow message="An error occurred while updating report ranges." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateReportRanges" access="public" returntype="void">
    <cfargument name="customStart" type="date" required="true">
    <cfargument name="customEnd" type="date" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE reportranges 
            SET rangestart = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.customStart#" />, 
                rangeend = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.customEnd#" />
            WHERE rangename = 'Custom'
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating report ranges: #cfcatch.message# Query: UPDATE reportranges SET rangestart = ?, rangeend = ? WHERE rangename = 'Custom' Parameters: customStart=#arguments.customStart#, customEnd=#arguments.customEnd#">
            <cfthrow message="An error occurred while updating report ranges." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getReportRange" access="public" returntype="query">
    <cfargument name="new_rangeid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT rangeid, rangename, rangestart, rangeend
            FROM reportranges
            WHERE rangeid = <cfqueryparam value="#arguments.new_rangeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getReportRange: #cfcatch.message#">
            <cfset result = queryNew("rangeid,rangename,rangestart,rangeend", "integer,varchar,date,date")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cfscript>
function getReportRanges(required struct params) {
    var result = queryNew("rangeid, rangename, rangestart, rangeend", "integer,varchar,timestamp,timestamp");
    var sql = "SELECT rangeid, rangename, rangestart, rangeend FROM reportranges WHERE 1=1";
    var conditions = [];
    var paramValues = [];

    // Define valid columns for WHERE clause
    var validColumns = ["rangeid", "rangename", "rangestart", "rangeend"];

    // Loop through params to build dynamic WHERE clause
    for (var key in params) {
        if (listFindNoCase(validColumns, key)) {
            arrayAppend(conditions, "#key# = ?");
            arrayAppend(paramValues, {value=params[key], type=getCFSQLType(key)});
        }
    }

    // Append conditions to SQL if any
    if (arrayLen(conditions) > 0) {
        sql &= " AND " & arrayToList(conditions, " AND ");
    } else {
        // Return empty query if no valid conditions are provided
        return result;
    }

    // Execute the query with error handling
    try {
        result = queryExecute(
            sql,
            paramValues,
            {datasource="abod"}
        );
    } catch (any e) {
        cflog(text="Error executing query: #e.message#", file="application.log");
        return result;
    }

    return result;
}

// Function to map column names to CFSQL types
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
            return "CF_SQL_VARCHAR"; // Default type
    }
}
</cfscript>


This ColdFusion function `getReportRanges` dynamically constructs a SQL query based on input parameters. It uses `cfqueryparam` for secure parameterization and includes error handling with logging. The function ensures only valid columns are used in the `WHERE` clause and returns an empty query set if no valid conditions are provided.</cfcomponent>
