<cfcomponent displayname="ReportUserService" hint="Handles operations for ReportUser table" output="false"> 
<cffunction name="SELreports_user" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="reportID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT r.ID as new_iD
        FROM reports_user r
        WHERE r.userid = <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.userID#" />
        AND r.reportid = <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.reportID#" />
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
        WHERE r.userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        AND r.reportid = <cfquery result="result" param value="#arguments.new_reportid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELreports_user_24725" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT * 
        FROM reports_user 
        WHERE userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
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
        WHERE reportid = <cfquery result="result" param value="#arguments.reportid#" cfsqltype="CF_SQL_INTEGER">
        AND userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        AND reportname = <cfquery result="result" param value="#arguments.reportname#" cfsqltype="CF_SQL_VARCHAR">
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

    <cfquery result="result"  name="insertQuery">
        INSERT INTO reports_user 
        (reportid, reportname, reportorderno, reporttypeid, reportdescription, userid, colmd, colxl, datalabel, colorid) 
        VALUES 
        (
            <cfquery result="result" param value="#arguments.reportid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.reportname#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.reportorderno#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.reporttypeid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.reportdescription#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.colmd#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.colxl#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.datalabel#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.colorid#" cfsqltype="CF_SQL_INTEGER">
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
            r.userid = <cfquery result="result" param value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
        AND 
            t.reporttypeid <> <cfquery result="result" param value="4" cfsqltype="CF_SQL_INTEGER">
        ORDER BY 
            r.reportorderno
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="SELreports_user_24734" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="reportTypeID" type="numeric" default="4">

    <cfset var result = "">
    
            <cfquery name="result" datasource="abod">
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
                r.userid = <cfquery result="result" param value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER"> 
                AND t.reporttypeid = <cfquery result="result" param value="#arguments.reportTypeID#" cfsqltype="CF_SQL_INTEGER"> 
                AND i.userid = r.userid
            ORDER BY 
                r.reportorderno
        </cfquery>
        
        <cfreturn result>
</cffunction>
<cffunction name="SELreports_user_24736" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfset var result = "">
        <cfquery name="result" datasource="abod">
            SELECT i.itemvalueint AS item_13
            FROM reports_user u
            INNER JOIN reportitems i ON i.ID = u.id
            WHERE u.userid = <cfquery result="result" param value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
            AND u.reportid = <cfquery result="result" param value="13" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
    <cfreturn result>
</cffunction>
<cffunction name="SELreports_user_24737" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfargument name="reportId" type="numeric" required="true" default="17">
    
    <cfset var result = "">
    
        <cfquery name="result" datasource="abod">
            SELECT i.itemvalueint AS item_17
            FROM reports_user u
            INNER JOIN reportitems i ON i.ID = u.id
            WHERE u.userid = <cfquery result="result" param value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
            AND u.reportid = <cfquery result="result" param value="#arguments.reportId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
    
    <cfreturn result>
</cffunction></cfcomponent>
