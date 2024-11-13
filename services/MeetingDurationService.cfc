<cfcomponent displayname="MeetingDurationService" hint="Handles operations for MeetingDuration table" output="false"> 
<cffunction name="SELmtgdurations" access="public" returntype="query">
    <cfargument name="new_durhours" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT durid AS new_durid
        FROM mtgdurations
        WHERE durhours = <cfquery result="result" param value="#arguments.new_durhours#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELmtgdurations_24493" access="public" returntype="query">
    <cfargument name="new_durhours" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT durid AS new_durid
        FROM mtgdurations
        WHERE durhours = <cfquery result="result" param value="#arguments.new_durhours#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELmtgdurations_24655" access="public" returntype="query">
    <cfargument name="new_durid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT durid, durhours, durhours * 3600 AS durseconds, durname
        FROM mtgdurations
        WHERE durid = <cfquery result="result" param value="#arguments.new_durid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELmtgdurations_24656" access="public" returntype="query">
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
    <cfquery result="result"  name="queryResult">
        #sql#
        <cfloop array="#params#" index="param">
            <cfquery result="result" param value="#param.value#" cfsqltype="#param.cfsqltype#">
        </cfloop>
    </cfquery>

    <cfreturn queryResult>
</cffunction></cfcomponent>