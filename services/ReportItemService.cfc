<cfcomponent displayname="ReportItemService" hint="Handles operations for ReportItem table" output="false"> 
<cffunction name="INSreportitems" access="public" returntype="void">
    <cfargument name="itemLabel" type="string" required="true">
    <cfargument name="itemOrderNo" type="numeric" required="true">
    <cfargument name="itemValueInt" type="numeric" required="true">
    <cfargument name="ID" type="numeric" required="true">
    <cfargument name="itemDataset" type="string" required="true">

    <cfquery result="result" >
        INSERT INTO reportitems 
        (itemLabel, itemOrderNo, itemValueInt, ID, itemDataset, userid) 
        VALUES 
        (
            <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#arguments.itemLabel#" />,
            <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.itemOrderNo#" />,
            <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.itemValueInt#" />,
            <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.ID#" />,
            <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#arguments.itemDataset#" />,
            <cfquery result="result" param cfsqltype="cf_sql_integer" value="#session.userid#" />
        )
    </cfquery>
</cffunction>

<cffunction name="SELreportitems" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="reportid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT 
            r.reportid, 
            i.itemid, 
            i.itemLabel, 
            i.itemOrderNo, 
            i.itemValueInt, 
            i.itemDataset, 
            i.userid 
        FROM 
            reportitems i 
        INNER JOIN 
            reports_user r ON r.id = i.id 
        WHERE 
            i.userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
        AND 
            r.reportid = <cfquery result="result" param value="#arguments.reportid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELreportitems_24225" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="reportid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT DISTINCT i.itemdataset
        FROM reportitems i
        INNER JOIN reports_user r ON r.id = i.id
        WHERE i.userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        AND r.reportid = <cfquery result="result" param value="#arguments.reportid#" cfsqltype="CF_SQL_INTEGER">
        ORDER BY i.itemdataset
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELreportitems_24226" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="reportid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT DISTINCT i.itemlabel
        FROM reportitems i
        INNER JOIN reports_user r ON r.id = i.id
        WHERE i.userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        AND r.reportid = <cfquery result="result" param value="#arguments.reportid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELreportitems_24227" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="reportid" type="numeric" required="true">
    <cfargument name="itemdataset" type="string" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT DISTINCT 
            i.itemlabel, 
            i.itemValueInt 
        FROM 
            reportitems i 
        INNER JOIN 
            reports_user r ON r.id = i.id 
        WHERE 
            i.userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND r.reportid = <cfquery result="result" param value="#arguments.reportid#" cfsqltype="CF_SQL_INTEGER"> 
            AND i.itemDataset = <cfquery result="result" param value="#arguments.itemdataset#" cfsqltype="CF_SQL_VARCHAR"> 
        ORDER BY 
            i.itemlabel
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="DELreportitems" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">

    <cfquery result="result" >
        DELETE FROM reportitems
        WHERE userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="INSreportitems_24233" access="public" returntype="void">
    <cfargument name="newLabel" type="string" required="true">
    <cfargument name="itemOrderNo" type="numeric" required="true">
    <cfargument name="newID" type="numeric" required="true">
    <cfargument name="newItemDataSet" type="string" required="true">
    <cfargument name="userID" type="numeric" required="true">

    <cfquery result="result" >
        INSERT INTO reportitems 
        (itemLabel, itemOrderNo, itemValueInt, ID, itemDataset, userid) 
        VALUES (
            <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#arguments.newLabel#" />,
            <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.itemOrderNo#" />,
            <cfquery result="result" param cfsqltype="cf_sql_integer" value="0" />,
            <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.newID#" />,
            <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#arguments.newItemDataSet#" />,
            <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.userID#" />
        )
    </cfquery>
</cffunction>

<cffunction name="UPDreportitems" access="public" returntype="void">
    <cfargument name="new_itemvalueint" type="numeric" required="true">
    <cfargument name="new_itemid" type="numeric" required="true">

        <cfquery result="result"  name="updateQuery" datasource="abod">
            UPDATE reportitems 
            SET itemValueInt = <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.new_itemvalueint#" />
            WHERE itemid = <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.new_itemid#" />
        </cfquery>
        
</cffunction>
<cffunction name="RESreportitems" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    
    <cfset var result = "">
    
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM reportitems
            WHERE userid = <cfquery result="result" param value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
    
    <cfreturn result>
</cffunction></cfcomponent>
