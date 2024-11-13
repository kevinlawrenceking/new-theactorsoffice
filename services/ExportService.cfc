<cfcomponent displayname="ExportService" hint="Handles operations for Export table" output="false"> 
    <cffunction name="INSexports" access="public" returntype="void">
        <cfargument name="userid" type="numeric" required="true">

        <cfquery result="result"  name="insertQuery">
            INSERT INTO exports (userid) 
            VALUES (<cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">)
        </cfquery>
    </cffunction>

    <cffunction name="UPDexports" access="public" returntype="void">
        <cfargument name="exportID" type="numeric" required="true">
        <cfargument name="status" type="string" required="true">

        <cfquery result="result" >
            UPDATE exports
            SET exportstatus = <cfquery result="result" param value="#arguments.status#" cfsqltype="CF_SQL_VARCHAR">
            WHERE exportid = <cfquery result="result" param value="#arguments.exportID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
    </cffunction>
</cfcomponent>