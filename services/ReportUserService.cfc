<cfcomponent displayname="ReportUserService" hint="Handles operations for ReportUser table" output="false"> 
<cffunction name="SELreports_user" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="reportID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT r.ID as new_iD
        FROM reports_user r
        WHERE r.userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#" />
        AND r.reportid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.reportID#" />
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="SELreports_user_24232" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_reportid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT r.ID as new_iD
        FROM reports_user r
        WHERE r.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        AND r.reportid = <cfqueryparam value="#arguments.new_reportid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELreports_user_24725" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT * 
        FROM reports_user 
        WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="SELreports_user_24728" access="public" returntype="query">
    <cfargument name="reportid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="reportname" type="string" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT reportid, reportname, reportorderno, reporttypeid, reportdescription, colorid
        FROM reports_user
        WHERE reportid = <cfqueryparam value="#arguments.reportid#" cfsqltype="CF_SQL_INTEGER">
        AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        AND reportname = <cfqueryparam value="#arguments.reportname#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="INSreports_user" access="public" returntype="void">
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

    <cfquery name="insertQuery">
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
</cffunction>

<cffunction name="SELreports_user_24733" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfset var result = "">

    <cfquery name="result">
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
</cffunction>

<cffunction name="SELreports_user_24734" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="reportTypeID" type="numeric" default="4">

    <cfset var result = "">

    <cfquery name="result">
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
            reporttypes t ON t