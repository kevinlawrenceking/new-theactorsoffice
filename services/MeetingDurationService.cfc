<cfcomponent displayname="MeetingDurationService" hint="Handles operations for MeetingDuration table" output="false"> 
<cffunction name="getDurationsByHours" access="public" returntype="query">
    <cfargument name="new_durhours" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT durid AS new_durid
            FROM mtgdurations
            WHERE durhours = <cfqueryparam value="#arguments.new_durhours#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getDurationsByHours: #cfcatch.message#">
            <cfreturn queryNew("new_durid", "integer")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getDurationsByHours" access="public" returntype="query">
    <cfargument name="new_durhours" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT durid AS new_durid
            FROM mtgdurations
            WHERE durhours = <cfqueryparam value="#arguments.new_durhours#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getDurationsByHours: #cfcatch.message# Query: SELECT durid AS new_durid FROM mtgdurations WHERE durhours = ? Parameters: #arguments.new_durhours#">
            <cfset result = queryNew("new_durid")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getMtgDurations" access="public" returntype="query">
    <cfargument name="new_durid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT durid, durhours, durhours * 3600 AS durseconds, durname
            FROM mtgdurations
            WHERE durid = <cfqueryparam value="#arguments.new_durid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getMtgDurations: #cfcatch.message#">
            <cfreturn queryNew("durid,durhours,durseconds,durname", "integer,double,double,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getMtgDurations" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    
    <cfset var queryResult = "">
    <cfset var sql = "SELECT durid, durhours, durname FROM mtgdurations">
    <cfset var whereClauses = []>
    <cfset var params = []>
    
    <!--- Build WHERE clause dynamically --->
    <cfloop collection="#arguments.conditions#" item="key">
        <cfif listFindNoCase("durid,durhours,durname", key)>
            <cfset arrayAppend(whereClauses, "#key# = ?")>
            <cfset arrayAppend(params, {value=arguments.conditions[key], cfsqltype=getSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Add WHERE clause if conditions exist --->
    <cfif arrayLen(whereClauses) gt 0>
        <cfset sql &= " WHERE " & arrayToList(whereClauses, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause --->
    <cfset sql &= " ORDER BY durid">

    <!--- Execute the query --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error executing query: #cfcatch.message# SQL: #sql# Parameters: #serializeJSON(params)#">
            <cfset queryResult = queryNew("durid,durhours,durname")> <!--- Return empty query on error --->
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction></cfcomponent>
