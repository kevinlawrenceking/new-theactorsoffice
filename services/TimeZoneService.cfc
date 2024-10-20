<cfcomponent displayname="TimeZoneService" hint="Handles operations for TimeZone table" output="false" > 
<cffunction name="gettimezones" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="tzid">

    <cfset var sql = "SELECT tzid, gmt, tzname, TZOFFSETFROM, TZOFFSETFROM_DAYLIGHT, TZOFFSETTO, TZOFFSETTO_DAYLIGHT, TZGENERAL, utcHourOffset, utcHourOffset_daylight FROM timezones WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var params = []>
    <cfset var validColumns = "tzid,gmt,tzname,TZOFFSETFROM,TZOFFSETFROM_DAYLIGHT,TZOFFSETTO,TZOFFSETTO_DAYLIGHT,TZGENERAL,utcHourOffset,utcHourOffset_daylight">
    <cfset var validOrderColumns = "tzid,gmt,tzname,utcHourOffset,utcHourOffset_daylight">
    <cfset var result = "">

    <cftry>
        <!--- Build dynamic WHERE clause --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(params, {value=arguments.filters[key], cfsqltype=de(listFindNoCase("tzid,gmt,tzname,TZOFFSETFROM,TZOFFSETFROM_DAYLIGHT,TZOFFSETTO,TZOFFSETTO_DAYLIGHT,TZGENERAL", key) ? "CF_SQL_VARCHAR" : "CF_SQL_DECIMAL")})>
            </cfif>
        </cfloop>

        <!--- Append WHERE clauses if any --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log error details --->
        <cflog file="application" text="Error in gettimezones: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
        
        <!--- Return an empty query with correct schema on error --->
        <cfset result = queryNew("tzid,gmt,tzname,TZOFFSETFROM,TZOFFSETFROM_DAYLIGHT,TZOFFSETTO,TZOFFSETTO_DAYLIGHT,TZGENERAL,utcHourOffset,utcHourOffset_daylight", "varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,decimal,decimal")>
    </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction></cfcomponent>
