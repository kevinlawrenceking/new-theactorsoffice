<cfcomponent displayname="ExportService" hint="Handles operations for Export table" output="false"> 
    <cffunction name="INSexports" access="public" returntype="void">
        <cfargument name="userid" type="numeric" required="true">

        <cfquery name="insertQuery">
            INSERT INTO exports (userid) 
            VALUES (<cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">)
        </cfquery>
    </cffunction>

    <cffunction name="UPDexports" access="public" returntype="void">
        <cfargument name="exportID" type="numeric" required="true">
        <cfargument name="status" type="string" required="true">

        <cfquery>
            UPDATE exports
            SET exportstatus = <cfqueryparam value="#arguments.status#" cfsqltype="CF_SQL_VARCHAR">
            WHERE exportid = <cfqueryparam value="#arguments.exportID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
    </cffunction>
</cfcomponent>