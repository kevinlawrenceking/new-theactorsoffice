<cfcomponent displayname="ExportService" hint="Handles operations for Export table" output="false"> 
<cffunction name="insertExport" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery name="insertQuery" datasource="yourDataSource">
            INSERT INTO exports (userid) 
            VALUES (<cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">)
        </cfquery>

        <cfcatch type="any">
            <cflog file="application" text="Error in insertExport function: #cfcatch.message# Query: INSERT INTO exports (userid) VALUES (#arguments.userid#)" />
            <cfthrow message="Database error occurred while inserting export." detail="#cfcatch.detail#"/>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateExportStatus" access="public" returntype="void">
    <cfargument name="exportID" type="numeric" required="true">
    <cfargument name="status" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE exports
            SET exportstatus = <cfqueryparam value="#arguments.status#" cfsqltype="cf_sql_varchar">
            WHERE exportid = <cfqueryparam value="#arguments.exportID#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating export status: #cfcatch.message#">
            <cflog file="application" text="Query: UPDATE exports SET exportstatus = ? WHERE exportid = ?">
            <cflog file="application" text="Parameters: status=#arguments.status#, exportID=#arguments.exportID#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
