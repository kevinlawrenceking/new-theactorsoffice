<cfcomponent displayname="ReportUserService" hint="Handles operations for ReportUser table" output="false"> 
<cffunction name="getReportUserID" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="reportID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT r.ID as new_iD
            FROM reports_user r
            WHERE r.userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#" />
            AND r.reportid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.reportID#" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getReportUserID: #cfcatch.message#">
            <cfset result = queryNew("new_iD", "integer")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getReportUserById" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_reportid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT r.ID as new_iD
            FROM reports_user r
            WHERE r.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND r.reportid = <cfqueryparam value="#arguments.new_reportid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getReportUserById: #cfcatch.message# Query: SELECT r.ID as new_iD FROM reports_user r WHERE r.userid = ? AND r.reportid = ? Parameters: #arguments.userid#, #arguments.new_reportid#">
            <cfreturn queryNew("new_iD", "integer")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="getUserReports" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT * 
            FROM reports_user 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserReports: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getReportDetails" access="public" returntype="query">
    <cfargument name="reportid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="reportname" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT reportid, reportname, reportorderno, reporttypeid, reportdescription, colorid
            FROM reports_user
            WHERE reportid = <cfqueryparam value="#arguments.reportid#" cfsqltype="CF_SQL_INTEGER">
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND reportname = <cfqueryparam value="#arguments.reportname#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getReportDetails: #cfcatch.message#">
            <cfset result = queryNew("reportid, reportname, reportorderno, reporttypeid, reportdescription, colorid")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="insertReportUser" access="public" returntype="void">
    <cfargument name="reportid" type="numeric" required="true">
    <cfargument name="reportname" type="string" required="true">
    <cfargument name="reportorderno" type="numeric" required="true">
    <cfargument name="reporttypeid" type="numeric" required="true">
    <cfargument name="reportdescription" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="colmd" type="numeric" required="true">
    <cfargument name="colxl" type="numeric" required="true">
    <cfargument name="datalabel" type="string" required="true">
    <cfargument name="colorid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="#yourDatasource#" name="insertQuery">
            INSERT INTO reports_user 
            (reportid, reportname, reportorderno, reporttypeid, reportdescription, userid, colmd, colxl, datalabel, colorid) 
            VALUES 
            (
                <cfqueryparam value="#arguments.reportid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.reportname#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.reportorderno#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.reporttypeid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.reportdescription#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.colmd#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.colxl#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.datalabel#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.colorid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error inserting into reports_user: #cfcatch.message#">
            <!--- Optionally rethrow or handle the error further --->
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getUserReports" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                r.ID, 
                r.reportid, 
                r.userid, 
                r.reportname, 
                r.reportorderno, 
                r.reporttypeid, 
                r.datalabel, 
                t.reporttypename, 
                r.reportdescription, 
                r.colmd, 
                r.colxl, 
                r.colorid, 
                c.colorname, 
                c.colorscheme
            FROM 
                reports_user r
            INNER JOIN 
                reporttypes t ON t.reporttypeid = r.reporttypeid
            INNER JOIN 
                reportcolors c ON c.colorid = r.colorid
            WHERE 
                r.userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
            AND 
                t.reporttypeid <> <cfqueryparam value="4" cfsqltype="CF_SQL_INTEGER">
            ORDER BY 
                r.reportorderno
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserReports: #cfcatch.message#">
            <cfreturn queryNew("ID,reportid,userid,reportname,reportorderno,reporttypeid,datalabel,reporttypename,reportdescription,colmd,colxl,colorid,colorname,colorscheme")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getUserReports" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="reportTypeID" type="numeric" default="4">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                r.ID, 
                r.reportid, 
                r.userid, 
                r.reportname, 
                r.reportorderno, 
                r.reporttypeid, 
                r.datalabel, 
                t.reporttypename, 
                r.reportdescription, 
                r.colmd, 
                r.colxl, 
                i.itemvalueint AS statvalue
            FROM 
                reports_user r
            INNER JOIN 
                reporttypes t ON t.reporttypeid = r.reporttypeid
            INNER JOIN 
                reportitems i ON i.id = r.id
            WHERE 
                r.userid = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER"> 
                AND t.reporttypeid = <cfqueryparam value="#arguments.reportTypeID#" cfsqltype="CF_SQL_INTEGER"> 
                AND i.userid = r.userid
            ORDER BY 
                r.reportorderno
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserReports: #cfcatch.message# Query: SELECT ... Parameters: userID=#arguments.userID#, reportTypeID=#arguments.reportTypeID#">
            <cfreturn queryNew("ID,reportid,userid,reportname,reportorderno,reporttypeid,datalabel,reporttypename,reportdescription,colmd,colxl,statvalue")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getReportItem13" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfset var result = "">
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT i.itemvalueint AS item_13
            FROM reports_user u
            INNER JOIN reportitems i ON i.ID = u.id
            WHERE u.userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
            AND u.reportid = <cfqueryparam value="13" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getReportItem13: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    <cfreturn result>
</cffunction>
<cffunction name="getItemValueInt" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfargument name="reportId" type="numeric" required="true" default="17">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT i.itemvalueint AS item_17
            FROM reports_user u
            INNER JOIN reportitems i ON i.ID = u.id
            WHERE u.userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
            AND u.reportid = <cfqueryparam value="#arguments.reportId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getItemValueInt: #cfcatch.message# Query: SELECT i.itemvalueint AS item_17 FROM reports_user u INNER JOIN reportitems i ON i.ID = u.id WHERE u.userid = ? AND u.reportid = ? Parameters: userId=#arguments.userId#, reportId=#arguments.reportId#">
            <cfreturn queryNew("item_17")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
