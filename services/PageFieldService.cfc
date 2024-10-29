<cfcomponent displayname="PageFieldService" hint="Handles operations for PageField table" output="false"> 
<cffunction name="getFnameByPgid" access="public" returntype="query">
    <cfargument name="rpgid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT fname 
            FROM pgfields 
            WHERE pgid = <cfqueryparam value="#arguments.rpgid#" cfsqltype="CF_SQL_INTEGER"> 
            AND updatename = <cfqueryparam value="ID" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getFnameByPgid: #cfcatch.message# - Query: SELECT fname FROM pgfields WHERE pgid = ? AND updatename = 'ID' - Parameters: rpgid=#arguments.rpgid#">
            <cfset result = queryNew("fname")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="getPgFieldsByPgidAndUpdateName" access="public" returntype="query">
    <cfargument name="rpgid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM pgfields
            WHERE pgid = <cfqueryparam value="#arguments.rpgid#" cfsqltype="CF_SQL_INTEGER">
            AND updatename = <cfqueryparam value="ID" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getPgFieldsByPgidAndUpdateName: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getPgFieldsByPgidAndUpdateName" access="public" returntype="query">
    <cfargument name="pgid" type="numeric" required="true">
    <cfargument name="updatename" type="string" required="true" default="ID">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT * 
            FROM pgfields 
            WHERE pgid = <cfqueryparam value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER"> 
            AND updatename = <cfqueryparam value="#arguments.updatename#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getPgFieldsByPgidAndUpdateName: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
