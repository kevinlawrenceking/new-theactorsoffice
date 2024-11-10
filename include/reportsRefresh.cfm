<!--- This ColdFusion page processes report data based on user input and generates report items. --->
<cfparam name="new_rangeid" default="1" />
<cfparam name="anchortag" default="" />
<cfparam name="customstart" default="" />
<cfparam name="customend" default="" />
<cfparam name="new_audsourceid" default="0" />
<cfparam name="new_audsourceidb" default="0" />
<cfparam name="new_audcatid" default="1" />
<cfparam name="refreshdata_yn" default="N" />

<!--- Check if the user is logged in and set the user ID. --->
<cfif isdefined('session.userid')>
    <cfset userid = session.userid />
</cfif>

<!--- Proceed if the user ID is not "0". --->
<cfif userid neq 0>
    <cfinclude template="/include/reportrangegenerator.cfm" />
    <cfset i = 0 />
    <cfinclude template="/include/qry/delete_all_282_1.cfm" />
    <cfinclude template="/include/qry/rangeselected_282_2.cfm" />

    <!--- Set the start date based on the selected range. --->
    <cfif IsDate(rangeselected.rangestart)>
        <cfset new_rangestart = DateFormat(rangeselected.rangestart, "yyyy-mm-dd")>
    <cfelse>
        <!--- Set a very old date as the default value. --->
        <cfset new_rangestart = "1900-01-01">
    </cfif>

    <!--- Set the end date based on the selected range. --->
    <cfif IsDate(rangeselected.rangeend)>
        <cfset new_rangeend = DateFormat(rangeselected.rangeend, "yyyy-mm-dd")>
    <cfelse>
        <!--- Set a future date as the default value. --->
        <cfset new_rangeend = "2100-01-01">
    </cfif>

    <cfinclude template="/include/qry/report_10_282_3.cfm" />

    <!--- Loop through report 10 and process each item. --->
    <cfloop query="report_10">
        <cfset i++ />
        <cfset new_reportid = "10" />
        <cfset new_label = report_10.label />
        <cfset new_itemValueInt = report_10.totals />
        <cfset new_itemDataset = report_10.itemDataset />
        <cfinclude template="/include/Insert_ReportItem.cfm" />
    </cfloop>

    <cfset i = 0 />
    <cfinclude template="/include/qry/report_4_loop_282_4.cfm" />

    <!--- Loop through report 4 and process each item. --->
    <cfloop query="report_4_loop">
        <cfset i++ />
        <cfinclude template="/include/qry/findid_282_5.cfm" />

        <!--- Check if the item exists and set the item value. --->
        <cfif findid.recordcount eq 1>
            <cfset new_ID = findid.new_id />
        </cfif>

        <cfinclude template="/include/qry/Insert_ReportItems_282_6.cfm" />

        <cfset new_itemid = result.GENERATEDKEY />
        <cfinclude template="/include/qry/Findit_282_7.cfm" />

        <!--- Check if the item exists and set the item value. --->
        <cfif findit.recordcount eq 0>
            <cfset new_itemvalueint = 0 />
        <cfelse>
            <cfset new_itemvalueint = int(FindIt.totals) />
        </cfif>

        <cfinclude template="/include/qry/update_282_8.cfm" />
    </cfloop>

    <cfinclude template="/include/qry/report_11_282_9.cfm" />
    <cfset i = 0 />

    <!--- Loop through report 11 and process each item. --->
    <cfloop query="report_11">
        <cfset i++ />
        <cfset new_reportid = "11" />
        <cfset new_label = report_11.label />
        <cfset new_itemValueInt = report_11.totals />
        <cfset new_itemDataset = report_11.itemDataset />
        <cfinclude template="/include/Insert_ReportItem.cfm" />
    </cfloop>

    <!--- Rest of the code continues with similar pattern for other reports --->

</cfif>

<!--- Redirect to the reports page based on the presence of an anchor tag. --->
<cfif len(anchortag)>
    <cflocation url="/app/reports/?refresh=n&new_audsourceidb=#new_audsourceidb#&new_audsourceid=#new_audsourceid#&customstart=#customstart#&customend=#customend#&new_rangeid=#new_rangeid#&new_audcatid=#new_audcatid####anchortag#" addtoken="false" />
<cfelse>
    <cflocation url="/app/reports/?refresh=n&new_audsourceidb=#new_audsourceidb#&new_audsourcid=#new_audsourceid#&customstart=#customstart#&customend=#customend#&new_rangeid=#new_rangeid#&new_audcatid=#new_audcatid#" addtoken="false" />
</cfif>

<!--- Modifications were made according to the following rules: 1, 2, 3, 4, 5, 6, 7, 9, 10, 11 --->