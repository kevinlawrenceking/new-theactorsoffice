<cfcomponent displayname="ReportItemService" hint="Handles operations for ReportItem table" output="false"> 
<cffunction name="insertReportItem" access="public" returntype="void">
    <cfargument name="itemLabel" type="string" required="true">
    <cfargument name="itemOrderNo" type="numeric" required="true">
    <cfargument name="itemValueInt" type="numeric" required="true">
    <cfargument name="ID" type="numeric" required="true">
    <cfargument name="itemDataset" type="string" required="true">
    <cfset var local = {}>

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO reportitems 
            (itemLabel, itemOrderNo, itemValueInt, ID, itemDataset, userid) 
            VALUES 
            (
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.itemLabel#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.itemOrderNo#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.itemValueInt#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.ID#" />,
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.itemDataset#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#" />
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error in insertReportItem: #cfcatch.message# - Query: INSERT INTO reportitems (itemLabel, itemOrderNo, itemValueInt, ID, itemDataset, userid) VALUES (#arguments.itemLabel#, #arguments.itemOrderNo#, #arguments.itemValueInt#, #arguments.ID#, #arguments.itemDataset#, #session.userid#)" type="error">
            <cfthrow message="Error inserting report item." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getReportItems" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="reportid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
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
                i.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND 
                r.reportid = <cfqueryparam value="#arguments.reportid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getReportItems: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("reportid,itemid,itemLabel,itemOrderNo,itemValueInt,itemDataset,userid")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getDistinctItemDatasets" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="reportid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT DISTINCT i.itemdataset
            FROM reportitems i
            INNER JOIN reports_user r ON r.id = i.id
            WHERE i.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND r.reportid = <cfqueryparam value="#arguments.reportid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY i.itemdataset
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getDistinctItemDatasets: #cfcatch.message#; Query: SELECT DISTINCT i.itemdataset FROM reportitems i INNER JOIN reports_user r ON r.id = i.id WHERE i.userid = #arguments.userid# AND r.reportid = #arguments.reportid# ORDER BY i.itemdataset;">
            <cfset result = queryNew("itemdataset")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getDistinctItemLabels" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="reportid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT DISTINCT i.itemlabel
            FROM reportitems i
            INNER JOIN reports_user r ON r.id = i.id
            WHERE i.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND r.reportid = <cfqueryparam value="#arguments.reportid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getDistinctItemLabels: #cfcatch.message# Query: SELECT DISTINCT i.itemlabel FROM reportitems i INNER JOIN reports_user r ON r.id = i.id WHERE i.userid = ? AND r.reportid = ? Parameters: userid=#arguments.userid#, reportid=#arguments.reportid#">
            <cfthrow>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="getReportItems" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="reportid" type="numeric" required="true">
    <cfargument name="itemdataset" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT DISTINCT 
                i.itemlabel, 
                i.itemValueInt 
            FROM 
                reportitems i 
            INNER JOIN 
                reports_user r ON r.id = i.id 
            WHERE 
                i.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND r.reportid = <cfqueryparam value="#arguments.reportid#" cfsqltype="CF_SQL_INTEGER"> 
                AND i.itemDataset = <cfqueryparam value="#arguments.itemdataset#" cfsqltype="CF_SQL_VARCHAR"> 
            ORDER BY 
                i.itemlabel
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getReportItems: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("itemlabel,itemValueInt", "varchar,integer")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="deleteReportItems" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    
    <cftry>
        <cfquery datasource="abod">
            DELETE FROM reportitems
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error deleting report items: #cfcatch.message# Query: DELETE FROM reportitems WHERE userid = #arguments.userid#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertReportItems" access="public" returntype="void">
    <cfargument name="newLabel" type="string" required="true">
    <cfargument name="itemOrderNo" type="numeric" required="true">
    <cfargument name="newID" type="numeric" required="true">
    <cfargument name="newItemDataSet" type="string" required="true">
    <cfargument name="userID" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO reportitems 
            (itemLabel, itemOrderNo, itemValueInt, ID, itemDataset, userid) 
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.newLabel#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.itemOrderNo#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="0" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.newID#" />,
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.newItemDataSet#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#" />
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error inserting into reportitems: #cfcatch.message#">
            <!--- Additional error handling logic can be added here --->
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateReportItems" access="public" returntype="void">
    <cfargument name="new_itemvalueint" type="numeric" required="true">
    <cfargument name="new_itemid" type="numeric" required="true">

    <cftry>
        <cfquery name="updateQuery" datasource="yourDataSource">
            UPDATE reportitems 
            SET itemValueInt = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_itemvalueint#" />
            WHERE itemid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_itemid#" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating reportitems: #cfcatch.message#" />
            <cflog file="application" text="Query: UPDATE reportitems SET itemValueInt = ?, WHERE itemid = ?" />
            <cflog file="application" text="Parameters: new_itemvalueint=#arguments.new_itemvalueint#, new_itemid=#arguments.new_itemid#" />
            <cfthrow message="Error updating reportitems." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getReportItems" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM reportitems
            WHERE userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getReportItems: #cfcatch.message# Query: SELECT * FROM reportitems WHERE userid = #arguments.userId#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
