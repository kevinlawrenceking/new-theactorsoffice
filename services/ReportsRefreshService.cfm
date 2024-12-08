<cfcomponent displayname="ReportsRefreshService" hint="Handles operations for reports" output="false">


<cffunction name="report_10" access="public" returntype="void" output="false" hint="Generates report 10 and inserts into reportitems.">
        <cfargument name="userid" type="numeric" required="true">
        <cfargument name="new_rangestart" type="date" required="true">
        <cfargument name="new_rangeend" type="date" required="true">

        <!--- Fetch the report data --->
        <cfquery name="reportQuery" >
            SELECT 
                count(p.audprojectID) as totals,
                'Number of Callbacks' as label,
                'Auditions' as itemDataset
            FROM audprojects p
            INNER JOIN audroles r ON p.audprojectID = r.audprojectID
            WHERE r.isdeleted IS FALSE
            AND p.isDeleted IS FALSE
            AND r.iscallback = 1
            AND p.userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#">
            AND p.projdate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.new_rangestart#">
            AND p.projdate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.new_rangeend#">
        </cfquery>

        <cfset i = 0>

        <!--- Loop through the report data --->
        <cfloop query="reportQuery">
            <cfset i++>
            <cfset new_reportid = 10>
            <cfset new_label = reportQuery.label>
            <cfset new_itemValueInt = reportQuery.totals>
            <cfset new_itemDataset = reportQuery.itemDataset>

            <!--- Find the associated ID --->
            <cfquery name="findIdQuery">
                SELECT r.ID as new_ID
                FROM reports_user r
                WHERE r.userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#">
                AND r.reportid = <cfqueryparam cfsqltype="cf_sql_integer" value="#new_reportid#">
            </cfquery>

            <cfset new_id = findIdQuery.new_ID>
            <cfif NOT len(trim(new_id))>
                <cfset new_id = 0>
            </cfif>

            <!--- Sanitize the label --->
            <cfset new_label_new = Replace(new_label, "'", "", "All")>

            <!--- Insert report item --->
            <cfquery name="insertReportItemQuery">
                INSERT INTO reportitems (
                    itemLabel, itemOrderNo, itemValueInt, ID, itemDataset, userid
                ) VALUES (
                    <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_label_new#">,
                    <cfqueryparam cfsqltype="cf_sql_integer" value="#i#">,
                    <cfqueryparam cfsqltype="cf_sql_integer" value="#new_itemValueInt#">,
                    <cfqueryparam cfsqltype="cf_sql_integer" value="#new_id#">,
                    <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_itemDataset#">,
                    <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#">
                )
            </cfquery>
        </cfloop>
    </cffunction>

    <cffunction name="report_4" access="public" returntype="void" output="false">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="rangestart" type="date" required="true">
    <cfargument name="rangeend" type="date" required="true">

    <!--- Query to get initial report loop data --->
    <cfquery name="report_4_loop">
        SELECT 
            audstepid, 
            4 AS new_reportid,
            audtypeid AS new_audtypeid, 
            audtype, 
            audtype AS new_label, 
            audstep AS new_itemDataset
        FROM audtypes, audsteps
        WHERE audstepid IN (1, 2)
        ORDER BY audtypes.audtype, audsteps.audstep
    </cfquery>

    <!--- Loop through report data --->
    <cfloop query="report_4_loop">
        <!--- Increment order number --->
        <cfset i = i + 1>

        <!--- Find or set ID for the report item --->
        <cfquery name="findid">
            SELECT r.ID AS new_id
            FROM reports_user r
            WHERE r.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            AND r.reportid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#report_4_loop.new_reportid#">
        </cfquery>

        <cfif findid.recordcount eq 1>
            <cfset new_id = findid.new_id>
        <cfelse>
            <cfset new_id = 0>
        </cfif>

        <!--- Insert initial report item --->
        <cfquery name="Insert_ReportItems" result="insertResult">
            INSERT INTO reportitems (
                itemLabel, 
                itemOrderNo, 
                itemValueInt, 
                ID, 
                itemDataset, 
                userid
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#report_4_loop.new_label#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#i#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="0">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_id#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#report_4_loop.new_itemDataset#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            )
        </cfquery>

        <cfset new_itemid = insertResult.generatedKey>

        <!--- Find item totals --->
        <cfquery name="FindIt">
            SELECT
                COUNT(r.audroleid) AS totals
            FROM audtypes t
            LEFT JOIN events a ON a.audtypeid = t.audtypeid
            LEFT JOIN audroles r ON a.audroleid = r.audroleid
            LEFT JOIN audprojects p ON p.audprojectid = r.audprojectid
            LEFT JOIN audsteps st ON st.audstepid = a.audstepid
            WHERE a.isDeleted = 0
            AND p.isDeleted = 0
            AND a.audstepid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#report_4_loop.audstepid#">
            AND t.audtypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#report_4_loop.new_audtypeid#">
            AND p.projdate >= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangestart#">
            AND p.projdate <= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangeend#">
            AND p.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
        </cfquery>

        <!--- Determine the item value --->
        <cfif FindIt.recordcount eq 0>
            <cfset new_itemvalueint = 0>
        <cfelse>
            <cfset new_itemvalueint = FindIt.totals>
        </cfif>

        <!--- Update report item with totals --->
        <cfquery name="update">
            UPDATE reportitems
            SET itemValueInt = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_itemvalueint#">
            WHERE itemid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_itemid#">
        </cfquery>
    </cfloop>
</cffunction>



<cffunction name="report_11" access="public" returntype="void" output="false">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="rangestart" type="date" required="true">
    <cfargument name="rangeend" type="date" required="true">

    <!--- Initialize order number --->
    <cfset var i = 0>

    <!--- Query to calculate totals for redirects --->
    <cfquery name="report_11">
        SELECT 
            COUNT(p.audprojectID) AS totals,
            'Number of Redirects' AS label,
            'Auditions' AS itemDataset
        FROM audprojects p
        INNER JOIN audroles r ON p.audprojectID = r.audprojectID
        WHERE r.isdeleted = 0
        AND p.isDeleted = 0
        AND r.isredirect = 1
        AND p.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
        AND p.projdate >= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangestart#">
        AND p.projdate <= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangeend#">
    </cfquery>

    <!--- Loop through results --->
    <cfloop query="report_11">
        <!--- Increment order number --->
        <cfset i = i + 1>

        <!--- Define report variables --->
        <cfset var new_reportid = 11>
        <cfset var new_label = report_11.label>
        <cfset var new_itemValueInt = report_11.totals>
        <cfset var new_itemDataset = report_11.itemDataset>

        <!--- Find existing ID for report item --->
        <cfquery name="findid">
            SELECT r.ID AS new_id
            FROM reports_user r
            WHERE r.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            AND r.reportid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_reportid#">
        </cfquery>

        <cfif findid.recordcount eq 1>
            <cfset var new_id = findid.new_id>
        <cfelse>
            <cfset var new_id = 0>
        </cfif>

        <!--- Sanitize label --->
        <cfset var new_label_new = Replace(new_label, "'", "", "All")>

        <!--- Insert report item --->
        <cfquery name="Insert_ReportItems" result="insertResult">
            INSERT INTO reportitems (
                itemLabel, 
                itemOrderNo, 
                itemValueInt, 
                ID, 
                itemDataset, 
                userid
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_label_new#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#i#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_itemValueInt#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_id#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_itemDataset#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            )
        </cfquery>
    </cfloop>
</cffunction>

<cffunction name="report_12" access="public" returntype="void" output="false">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="rangestart" type="date" required="true">
    <cfargument name="rangeend" type="date" required="true">

    <!--- Initialize order number --->
    <cfset var i = 0>

    <!--- Query to calculate totals for pins/avails --->
    <cfquery name="report_12">
        SELECT 
            COUNT(p.audprojectID) AS totals,
            'Number of Pins/Avails' AS label,
            'Auditions' AS itemDataset
        FROM audprojects p
        INNER JOIN audroles r ON p.audprojectID = r.audprojectID
        WHERE r.isdeleted = 0
        AND p.isDeleted = 0
        AND r.ispin = 1
        AND p.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
        AND p.projdate >= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangestart#">
        AND p.projdate <= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangeend#">
    </cfquery>

    <!--- Loop through results --->
    <cfloop query="report_12">
        <!--- Increment order number --->
        <cfset i = i + 1>

        <!--- Define report variables --->
        <cfset var new_reportid = 12>
        <cfset var new_label = report_12.label>
        <cfset var new_itemValueInt = report_12.totals>
        <cfset var new_itemDataset = report_12.itemDataset>

        <!--- Find existing ID for report item --->
        <cfquery name="findid">
            SELECT r.ID AS new_id
            FROM reports_user r
            WHERE r.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            AND r.reportid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_reportid#">
        </cfquery>

        <cfif findid.recordcount eq 1>
            <cfset var new_id = findid.new_id>
        <cfelse>
            <cfset var new_id = 0>
        </cfif>

        <!--- Sanitize label --->
        <cfset var new_label_new = Replace(new_label, "'", "", "All")>

        <!--- Insert report item --->
        <cfquery name="Insert_ReportItems" result="insertResult">
            INSERT INTO reportitems (
                itemLabel, 
                itemOrderNo, 
                itemValueInt, 
                ID, 
                itemDataset, 
                userid
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_label_new#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#i#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_itemValueInt#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_id#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_itemDataset#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            )
        </cfquery>
    </cfloop>
</cffunction>


<cffunction name="report_13" access="public" returntype="void" output="false">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="rangestart" type="date" required="true">
    <cfargument name="rangeend" type="date" required="true">

    <!--- Initialize order number --->
    <cfset var i = 0>

    <!--- Query to calculate report data --->
    <cfquery name="report_13">
        SELECT 
            COUNT(p.audprojectID) AS totals,
            'Number of [Your Metric Here]' AS label,
            'Auditions' AS itemDataset
        FROM audprojects p
        INNER JOIN audroles r ON p.audprojectID = r.audprojectID
        WHERE r.isdeleted = 0
        AND p.isDeleted = 0
        AND [Your Condition Here]
        AND p.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
        AND p.projdate >= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangestart#">
        AND p.projdate <= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangeend#">
    </cfquery>

    <!--- Loop through report data --->
    <cfloop query="report_13">
        <!--- Increment order number --->
        <cfset i = i + 1>

        <!--- Define report variables --->
        <cfset var new_reportid = 13>
        <cfset var new_label = report_13.label>
        <cfset var new_itemValueInt = report_13.totals>
        <cfset var new_itemDataset = report_13.itemDataset>

        <!--- Find existing ID for the report item --->
        <cfquery name="findid">
            SELECT r.ID AS new_id
            FROM reports_user r
            WHERE r.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            AND r.reportid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_reportid#">
        </cfquery>

        <!--- Handle missing ID --->
        <cfset var new_id = 0>
        <cfif findid.recordcount eq 1>
            <cfset new_id = findid.new_id>
        </cfif>

        <!--- Sanitize label --->
        <cfset var new_label_new = Replace(new_label, "'", "", "All")>

        <!--- Insert report item --->
        <cfquery name="Insert_ReportItems" result="insertResult">
            INSERT INTO reportitems (
                itemLabel, 
                itemOrderNo, 
                itemValueInt, 
                ID, 
                itemDataset, 
                userid
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_label_new#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#i#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_itemValueInt#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_id#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_itemDataset#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            )
        </cfquery>
    </cfloop>
</cffunction>


<cffunction name="report_17" access="public" returntype="void" output="false">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="rangestart" type="date" required="true">
    <cfargument name="rangeend" type="date" required="true">

    <!--- Initialize order number --->
    <cfset var i = 0>

    <!--- Query to calculate report data --->
    <cfquery name="report_17">
        SELECT 
            COUNT(p.audprojectID) AS totals,
            'Number of Auditions' AS label,
            'Auditions' AS itemDataset
        FROM audprojects p
        INNER JOIN audroles r ON p.audprojectID = r.audprojectID
        WHERE r.isdeleted = 0
        AND p.isDeleted = 0
        AND p.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
        AND p.projdate >= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangestart#">
        AND p.projdate <= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangeend#">
    </cfquery>

    <!--- Loop through report data --->
    <cfloop query="report_17">
        <!--- Increment order number --->
        <cfset i = i + 1>

        <!--- Define report variables --->
        <cfset var new_reportid = 17>
        <cfset var new_label = report_17.label>
        <cfset var new_itemValueInt = report_17.totals>
        <cfset var new_itemDataset = report_17.itemDataset>

        <!--- Find existing ID for the report item --->
        <cfquery name="findid">
            SELECT r.ID AS new_id
            FROM reports_user r
            WHERE r.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            AND r.reportid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_reportid#">
        </cfquery>

        <!--- Handle missing ID --->
        <cfset var new_id = 0>
        <cfif findid.recordcount eq 1>
            <cfset new_id = findid.new_id>
        </cfif>

        <!--- Sanitize label --->
        <cfset var new_label_new = Replace(new_label, "'", "", "All")>

        <!--- Insert report item --->
        <cfquery name="Insert_ReportItems" result="insertResult">
            INSERT INTO reportitems (
                itemLabel, 
                itemOrderNo, 
                itemValueInt, 
                ID, 
                itemDataset, 
                userid
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_label_new#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#i#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_itemValueInt#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_id#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_itemDataset#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            )
        </cfquery>
    </cfloop>
</cffunction>

<cffunction name="report_3" access="public" returntype="void" output="false">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="rangestart" type="date" required="true">
    <cfargument name="rangeend" type="date" required="true">

    <!--- Initialize order number --->
    <cfset var i = 0>

    <!--- Query to calculate report data --->
    <cfquery name="report_3">
        SELECT
            COUNT(p.audprojectid) AS totals,
            c.audcatname AS label,
            'Auditions' AS itemDataset
        FROM audprojects p
        INNER JOIN audroles r ON p.audprojectID = r.audprojectID
        INNER JOIN audroletypes rt ON rt.audroletypeid = r.audroletypeid
        INNER JOIN audcategories c ON c.audCatId = rt.audcatid
        WHERE r.isdeleted = 0
        AND p.isDeleted = 0
        AND p.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
        AND p.projdate >= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangestart#">
        AND p.projdate <= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangeend#">
        GROUP BY c.audcatname
        ORDER BY c.audcatname
    </cfquery>

    <!--- Loop through report data --->
    <cfloop query="report_3">
        <!--- Increment order number --->
        <cfset i = i + 1>

        <!--- Define report variables --->
        <cfset var new_reportid = 3>
        <cfset var new_label = report_3.label>
        <cfset var new_itemValueInt = report_3.totals>
        <cfset var new_itemDataset = report_3.itemDataset>

        <!--- Find existing ID for the report item --->
        <cfquery name="findid">
            SELECT r.ID AS new_id
            FROM reports_user r
            WHERE r.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            AND r.reportid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_reportid#">
        </cfquery>

        <!--- Handle missing ID --->
        <cfset var new_id = 0>
        <cfif findid.recordcount eq 1>
            <cfset new_id = findid.new_id>
        </cfif>

        <!--- Sanitize label --->
        <cfset var new_label_new = Replace(new_label, "'", "", "All")>

        <!--- Insert report item --->
        <cfquery name="Insert_ReportItems" result="insertResult">
            INSERT INTO reportitems (
                itemLabel, 
                itemOrderNo, 
                itemValueInt, 
                ID, 
                itemDataset, 
                userid
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_label_new#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#i#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_itemValueInt#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_id#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_itemDataset#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            )
        </cfquery>
    </cfloop>
</cffunction>

<cffunction name="report_5" access="public" returntype="void" output="false">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="rangestart" type="date" required="true">
    <cfargument name="rangeend" type="date" required="true">

    <!--- Initialize order number --->
    <cfset var i = 0>

    <!--- Query to calculate report data --->
    <cfquery name="report_5">
        SELECT
            COUNT(p.audprojectid) AS totals,
            e.essencename AS label,
            'Auditions' AS itemDataset
        FROM audprojects p
        INNER JOIN audroles r ON p.audprojectID = r.audprojectID
        INNER JOIN audessences_audtion_xref x ON x.audroleid = r.audroleid
        INNER JOIN essences e ON e.essenceid = x.essenceid
        WHERE r.isdeleted = 0
        AND p.isDeleted = 0
        AND p.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
        AND p.projdate >= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangestart#">
        AND p.projdate <= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangeend#">
        GROUP BY e.essencename
        ORDER BY e.essencename
    </cfquery>

    <!--- Loop through report data --->
    <cfloop query="report_5">
        <!--- Increment order number --->
        <cfset i = i + 1>

        <!--- Define report variables --->
        <cfset var new_reportid = 5>
        <cfset var new_label = report_5.label>
        <cfset var new_itemValueInt = report_5.totals>
        <cfset var new_itemDataset = report_5.itemDataset>

        <!--- Find existing ID for the report item --->
        <cfquery name="findid">
            SELECT r.ID AS new_id
            FROM reports_user r
            WHERE r.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            AND r.reportid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_reportid#">
        </cfquery>

        <!--- Handle missing ID --->
        <cfset var new_id = 0>
        <cfif findid.recordcount eq 1>
            <cfset new_id = findid.new_id>
        </cfif>

        <!--- Sanitize label --->
        <cfset var new_label_new = Replace(new_label, "'", "", "All")>

        <!--- Insert report item --->
        <cfquery name="Insert_ReportItems" result="insertResult">
            INSERT INTO reportitems (
                itemLabel, 
                itemOrderNo, 
                itemValueInt, 
                ID, 
                itemDataset, 
                userid
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_label_new#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#i#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_itemValueInt#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_id#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_itemDataset#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            )
        </cfquery>
    </cfloop>
</cffunction>


<cffunction name="report_7" access="public" returntype="void" output="false">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="rangestart" type="date" required="true">
    <cfargument name="rangeend" type="date" required="true">
    <cfargument name="new_audcatid" type="numeric" required="true">

    <!--- Initialize variables --->
    <cfset var i = 0>
    <cfset var new_reportid = 7>
    <cfset var new_label = "">
    <cfset var new_itemValueInt = 0>
    <cfset var new_itemDataset = "">

    <!--- Query to fetch data --->
    <cfquery name="report_7">
        SELECT
            count(p.audprojectid) AS totals,
            rt.audroletype AS label,
            'Auditions' AS itemDataset
        FROM
            audprojects p
        INNER JOIN
            audroles r ON p.audprojectID = r.audprojectID
        INNER JOIN
            audroletypes rt ON r.audroletypeid = rt.audroletypeid
        INNER JOIN
            audsubcategories s ON s.audsubcatid = p.audsubcatid
        WHERE
            r.isdeleted = 0
            AND p.isDeleted = 0
            AND p.userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#">
            AND p.projdate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.rangestart#">
            AND p.projdate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.rangeend#">
            AND s.audcatid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_audcatid#">
        GROUP BY
            rt.audroletype
        HAVING
            rt.audroletype <> 'N/A'
        ORDER BY
            rt.audroletype
    </cfquery>

    <!--- Loop through the results and insert report items --->
    <cfloop query="report_7">
        <cfset i = i + 1>
        <cfset new_label = report_7.label>
        <cfset new_itemValueInt = report_7.totals>
        <cfset new_itemDataset = report_7.itemDataset>

        <!--- Find or create report item ID --->
        <cfquery name="findid">
            SELECT r.ID AS new_id
            FROM reports_user r
            WHERE r.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            AND r.reportid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_reportid#">
        </cfquery>

        <cfset var new_id = 0>
        <cfif findid.recordcount eq 1>
            <cfset new_id = findid.new_id>
        </cfif>

        <!--- Sanitize label --->
        <cfset var new_label_new = Replace(new_label, "'", "", "All")>

        <!--- Insert report item --->
        <cfquery name="Insert_ReportItems" result="insertResult">
            INSERT INTO reportitems (
                itemLabel,
                itemOrderNo,
                itemValueInt,
                ID,
                itemDataset,
                userid
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_label_new#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#i#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_itemValueInt#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_id#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_itemDataset#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            )
        </cfquery>
    </cfloop>
</cffunction>

<cffunction name="report_18" access="public" returntype="void" output="false">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="rangestart" type="date" required="true">
    <cfargument name="rangeend" type="date" required="true">
    <cfargument name="new_audsourceid" type="numeric" required="false" default="0">

    <!--- Initialize variables --->
    <cfset var i = 0>
    <cfset var new_reportid = 18>
    <cfset var new_label = "">
    <cfset var new_itemValueInt = 0>
    <cfset var new_itemDataset = "">

    <!--- Query to fetch data --->
    <cfquery name="report_18">
        SELECT 
            COUNT(p.audprojectid) AS totals, 
            'Non-Union' AS label, 
            'Auditions' AS itemDataset 
        FROM 
            audprojects p 
        INNER JOIN 
            audroles r ON p.audprojectID = r.audprojectID 
        INNER JOIN 
            audunions u ON u.unionid = p.unionid 
        INNER JOIN 
            audsources s ON s.audsourceid = r.audsourceid 
        WHERE 
            r.isdeleted = 0 
            AND p.isDeleted = 0 
            AND u.unionName = 'Non-Union' 
            <cfif arguments.new_audsourceid neq 0>
                AND s.audsourceid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audsourceid#">
            </cfif>
            AND p.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            AND p.projdate >= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangestart#">
            AND p.projdate <= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangeend#">
        GROUP BY 
            label, 
            itemDataset

        UNION ALL 

        SELECT 
            COUNT(p.audprojectid) AS totals, 
            'Union' AS label, 
            'Auditions' AS itemDataset 
        FROM 
            audprojects p 
        INNER JOIN 
            audroles r ON p.audprojectID = r.audprojectID 
        INNER JOIN 
            audunions u ON u.unionid = p.unionid 
        INNER JOIN 
            audsources s ON s.audsourceid = r.audsourceid 
        WHERE 
            r.isdeleted = 0 
            AND p.isDeleted = 0 
            AND u.unionName <> 'Non-Union' 
            <cfif arguments.new_audsourceid neq 0>
                AND s.audsourceid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audsourceid#">
            </cfif>
            AND p.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            AND p.projdate >= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangestart#">
            AND p.projdate <= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangeend#">
        GROUP BY 
            label, 
            itemDataset
        ORDER BY label
    </cfquery>

    <!--- Loop through the results and insert report items --->
    <cfloop query="report_18">
        <cfset i = i + 1>
        <cfset new_label = report_18.label>
        <cfset new_itemValueInt = report_18.totals>
        <cfset new_itemDataset = report_18.itemDataset>

        <!--- Find or create report item ID --->
        <cfquery name="findid">
            SELECT r.ID AS new_id
            FROM reports_user r
            WHERE r.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            AND r.reportid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_reportid#">
        </cfquery>

        <cfset var new_id = 0>
        <cfif findid.recordcount eq 1>
            <cfset new_id = findid.new_id>
        </cfif>

        <!--- Sanitize label --->
        <cfset var new_label_new = Replace(new_label, "'", "", "All")>

        <!--- Insert report item --->
        <cfquery name="Insert_ReportItems" result="insertResult">
            INSERT INTO reportitems (
                itemLabel,
                itemOrderNo,
                itemValueInt,
                ID,
                itemDataset,
                userid
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_label_new#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#i#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_itemValueInt#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_id#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_itemDataset#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            )
        </cfquery>
    </cfloop>
</cffunction>

<cffunction name="report_8" access="public" returntype="void" output="false">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="rangestart" type="date" required="true">
    <cfargument name="rangeend" type="date" required="true">
    <cfargument name="new_audcatid" type="numeric" required="true">

    <!--- Initialize variables --->
    <cfset var i = 0>
    <cfset var new_reportid = 8>
    <cfset var new_label = "">
    <cfset var new_itemValueInt = 0>
    <cfset var new_itemDataset = "">

    <!--- Query to fetch report data --->
    <cfquery name="report_8">
        SELECT
            COUNT(x.audprojectid) AS totals,
            m.medianame AS label,
            s.audcatid,
            'Auditions' AS itemDataset
        FROM audmedia m
        INNER JOIN audmedia_auditions_xref x ON x.mediaid = m.mediaid
        INNER JOIN audmediatypes t ON t.mediaTypeID = m.mediatypeid
        INNER JOIN audprojects p ON p.audprojectID = x.audprojectid
        INNER JOIN audsubcategories s ON s.audsubcatid = p.audsubcatid
        LEFT JOIN exttypes e ON e.mediaext = m.mediaext
        WHERE 
            m.isdeleted = 0
            AND x.audprojectid <> 0
            AND p.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            AND s.audcatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audcatid#">
            AND p.projdate >= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangestart#">
            AND p.projdate <= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangeend#">
        GROUP BY 
            m.medianame, t.mediatype, s.audcatid
        HAVING 
            t.mediatype = 'Headshot'
        ORDER BY 
            m.medianame
    </cfquery>

    <!--- Loop through the query results --->
    <cfloop query="report_8">
        <cfset i = i + 1>
        <cfset new_label = report_8.label>
        <cfset new_itemValueInt = report_8.totals>
        <cfset new_itemDataset = report_8.itemDataset>

        <!--- Find or create the report item ID --->
        <cfquery name="findid">
            SELECT r.ID AS new_id
            FROM reports_user r
            WHERE r.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            AND r.reportid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_reportid#">
        </cfquery>

        <cfset var new_id = 0>
        <cfif findid.recordcount eq 1>
            <cfset new_id = findid.new_id>
        </cfif>

        <!--- Sanitize the label --->
        <cfset var new_label_new = Replace(new_label, "'", "", "All")>

        <!--- Insert the report item --->
        <cfquery name="Insert_ReportItems" result="insertResult">
            INSERT INTO reportitems (
                itemLabel,
                itemOrderNo,
                itemValueInt,
                ID,
                itemDataset,
                userid
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_label_new#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#i#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_itemValueInt#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_id#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_itemDataset#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            )
        </cfquery>
    </cfloop>
</cffunction>


<cffunction name="report_2" access="public" returntype="void" output="false">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="rangestart" type="date" required="true">
    <cfargument name="rangeend" type="date" required="true">
    <cfargument name="new_audcatid" type="numeric" required="true">

    <!--- Initialize variables --->
    <cfset var i = 0>
    <cfset var new_reportid = 2>
    <cfset var new_label = "">
    <cfset var new_itemValueInt = 0>
    <cfset var new_itemDataset = "">
    <cfset var new_id = 0>

    <!--- Query to fetch report data --->
    <cfquery name="report_2">
    SELECT count(r.audroleid) as totals, g.audgenre as label, 'Auditions' as itemDataset
FROM audgenres_audition_xref x  INNER JOIN audroles r ON r.audroleid = x.audroleid
inner JOIN audgenres_user g ON g.audgenreid = x.audgenreid
INNER JOIN audprojects p on p.audprojectid = r.audprojectid
INNER JOIN audsubcategories s ON s.audsubcatid = p.audsubcatid
 WHERE 
            r.isdeleted = 0
            AND p.isDeleted = 0
            AND p.projdate >= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangestart#">
            AND p.projdate <= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangeend#">
            AND p.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            AND s.audcatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audcatid#">
        GROUP BY g.audgenre
        ORDER BY g.audgenre
    </cfquery>

    <!--- Loop through the query results --->
    <cfloop query="report_2">
        <cfset i = i + 1>
        <cfset new_label = report_2.label>
        <cfset new_itemValueInt = report_2.totals>
        <cfset new_itemDataset = report_2.itemDataset>

        <!--- Find or create the report item ID --->
        <cfquery name="findid">
            SELECT r.ID AS new_id
            FROM reports_user r
            WHERE r.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            AND r.reportid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_reportid#">
        </cfquery>

        <cfif findid.recordcount eq 1>
            <cfset new_id = findid.new_id>
        </cfif>

        <!--- Sanitize the label --->
        <cfset var new_label_new = Replace(new_label, "'", "", "All")>

        <!--- Insert the report item --->
        <cfquery name="Insert_ReportItems" result="insertResult">
            INSERT INTO reportitems (
                itemLabel,
                itemOrderNo,
                itemValueInt,
                ID,
                itemDataset,
                userid
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_label_new#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#i#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_itemValueInt#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_id#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_itemDataset#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
            )
        </cfquery>
    </cfloop>
</cffunction>



</cfcomponent>
