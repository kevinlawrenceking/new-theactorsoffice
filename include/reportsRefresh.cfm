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
<cfif #isdefined('userid')#>
    <cfset userid = userid />
</cfif>

<cfoutput>#new_audsourceid#</cfoutput>

<!--- Proceed if the user ID is not "0". --->
<cfif #userid# is not "0">
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
        <cfoutput>
            <cfset i = #i# + 1 />
            <cfset new_reportid = "10" />
            <cfset new_label = "#report_10.label#" />
            <cfset new_itemValueInt = "#report_10.totals#" />
            <cfset new_itemDataset = "#report_10.itemDataset#" />
        </cfoutput>
        <cfinclude template="/include/Insert_ReportItem.cfm" />
    </cfloop>

    <cfset i = 0 />
    <cfinclude template="/include/qry/report_4_loop_282_4.cfm" />

    <!--- Loop through report 4 and process each item. --->
    <cfloop query="report_4_loop">
        <cfoutput>
            <cfset i = #i# + 1 />
        </cfoutput>
        <cfinclude template="/include/qry/findid_282_5.cfm" />
        <cfoutput>
            <cfif #findid.recordcount# is "1">
                <cfset new_ID = #findid.new_id# />
            <cfelse>
                <cfset new_ID = #findid.new_id# />
            </cfif>
        </cfoutput>
        <cfinclude template="/include/qry/Insert_ReportItems_282_6.cfm" />
        <cfset new_itemid = result.GENERATEDKEY />
        <cfinclude template="/include/qry/Findit_282_7.cfm" />

        <!--- Check if the item exists and set the item value. --->
        <cfif #findit.recordcount# is "0">
            <cfset new_itemvalueint = 0 />
        <cfelse>
            <cfoutput>
                <cfset new_itemvalueint = #int(FindIt.totals)# />
            </cfoutput>
        </cfif>
        <cfinclude template="/include/qry/update_282_8.cfm" />
    </cfloop>

    <cfinclude template="/include/qry/report_11_282_9.cfm" />
    <cfset i = 0 />

    <!--- Loop through report 11 and process each item. --->
    <cfloop query="report_11">
        <cfoutput>
            <cfset i = #i# + 1 />
            <cfset new_reportid = "11" />
            <cfset new_label = "#report_11.label#" />
            <cfset new_itemValueInt = "#report_11.totals#" />
            <cfset new_itemDataset = "#report_11.itemDataset#" />
        </cfoutput>
        <cfinclude template="/include/Insert_ReportItem.cfm" />
    </cfloop>

    <cfinclude template="/include/qry/report_12_282_10.cfm" />
    <cfset i = 0 />

    <!--- Loop through report 12 and process each item. --->
    <cfloop query="report_12">
        <cfoutput>
            <cfset i = #i# + 1 />
            <cfset new_reportid = "12" />
            <cfset new_label = "#report_12.label#" />
            <cfset new_itemValueInt = "#report_12.totals#" />
            <cfset new_itemDataset = "#report_12.itemDataset#" />
        </cfoutput>
        <cfinclude template="/include/Insert_ReportItem.cfm" />
    </cfloop>

    <cfinclude template="/include/qry/report_17_282_11.cfm" />
    <cfset i = 0 />

    <!--- Loop through report 17 and process each item. --->
    <cfloop query="report_17">
        <cfoutput>
            <cfset i = #i# + 1 />
            <cfset new_reportid = "17" />
            <cfset new_label = "#report_17.label#" />
            <cfset new_itemValueInt = "#report_17.totals#" />
            <cfset new_itemDataset = "#report_17.itemDataset#" />
        </cfoutput>
        <cfinclude template="/include/Insert_ReportItem.cfm" />
    </cfloop>

    <cfinclude template="/include/qry/report_13_282_12.cfm" />
    <cfset i = 0 />

    <!--- Loop through report 13 and process each item. --->
    <cfloop query="report_13">
        <cfoutput>
            <cfset i = #i# + 1 />
            <cfset new_reportid = "13" />
            <cfset new_label = "#report_13.label#" />
            <cfset new_itemValueInt = "#report_13.totals#" />
            <cfset new_itemDataset = "#report_13.itemDataset#" />
        </cfoutput>
        <cfinclude template="/include/Insert_ReportItem.cfm" />
    </cfloop>

    <cfinclude template="/include/qry/report_3_282_13.cfm" />
    <cfset i = 0 />

    <!--- Loop through report 3 and process each item. --->
    <cfloop query="report_3">
        <cfoutput>
            <cfset i = #i# + 1 />
            <cfset new_reportid = "3" />
            <cfset new_label = "#report_3.label#" />
            <cfset new_itemValueInt = "#report_3.totals#" />
            <cfset new_itemDataset = "#report_3.itemDataset#" />
        </cfoutput>
        <cfinclude template="/include/Insert_ReportItem.cfm" />
    </cfloop>

    <cfinclude template="/include/qry/report_5_282_14.cfm" />
    <cfset i = 0 />

    <!--- Loop through report 5 and process each item. --->
    <cfloop query="report_5">
        <cfoutput>
            <cfset i = #i# + 1 />
            <cfset new_reportid = "5" />
            <cfset new_label = "#report_5.label#" />
            <cfset new_itemValueInt = "#report_5.totals#" />
            <cfset new_itemDataset = "#report_5.itemDataset#" />
        </cfoutput>
        <cfinclude template="/include/Insert_ReportItem.cfm" />
    </cfloop>

    <!--- Check the value of new_audsourceidb and include corresponding queries. --->
    <cfif #new_audsourceidb# is "0">
        <cfinclude template="/include/qry/report_6_282_15.cfm" />
    </cfif>

    <cfif #new_audsourceidb# is "1">
        <cfinclude template="/include/qry/report_6_282_16.cfm" />
    </cfif>

    <cfif #new_audsourceidb# is "2">
        <cfinclude template="/include/qry/report_6_282_17.cfm" />
    </cfif>

    <cfif #new_audsourceidb# is "3">
        <cfinclude template="/include/qry/report_6_282_18.cfm" />
    </cfif>

    <cfif #new_audsourceidb# is "4">
        <cfinclude template="/include/qry/report_6_282_19.cfm" />
    </cfif>

    <cfset i = 0 />
    <cfloop query="report_6">
        <cfoutput>
            <cfset i = #i# + 1 />
            <cfset new_reportid = "6" />
            <cfset new_label = "#report_6.label#" />
            <cfset new_itemValueInt = "#report_6.totals#" />
            <cfset new_itemDataset = "#report_6.itemDataset#" />
        </cfoutput>
        <cfinclude template="/include/Insert_ReportItem.cfm" />
    </cfloop>

    <cfinclude template="/include/qry/report_7_282_20.cfm" />
    <cfset i = 0 />

    <!--- Loop through report 7 and process each item. --->
    <cfloop query="report_7">
        <cfoutput>
            <cfset i = #i# + 1 />
            <cfset new_reportid = "7" />
            <cfset new_label = "#report_7.label#" />
            <cfset new_itemValueInt = "#report_7.totals#" />
            <cfset new_itemDataset = "#report_7.itemDataset#" />
        </cfoutput>
        <cfinclude template="/include/Insert_ReportItem.cfm" />
    </cfloop>

    <cfinclude template="/include/qry/report_18_282_21.cfm" />
    <cfset i = 0 />

    <!--- Loop through report 18 and process each item. --->
    <cfloop query="report_18">
        <cfoutput>
            <cfset i = #i# + 1 />
            <cfset new_reportid = "18" />
            <cfset new_label = "#report_18.label#" />
            <cfset new_itemValueInt = "#report_18.totals#" />
            <cfset new_itemDataset = "#report_18.itemDataset#" />
        </cfoutput>
        <cfinclude template="/include/Insert_ReportItem.cfm" />
    </cfloop>

    <cfinclude template="/include/qry/report_8_282_22.cfm" />
    <cfset i = 0 />

    <!--- Loop through report 8 and process each item. --->
    <cfloop query="report_8">
        <cfoutput>
            <cfset i = #i# + 1 />
            <cfset new_reportid = "8" />
            <cfset new_label = "#report_8.label#" />
            <cfset new_itemValueInt = "#report_8.totals#" />
            <cfset new_itemDataset = "#report_8.itemDataset#" />
        </cfoutput>
        <cfinclude template="/include/Insert_ReportItem.cfm" />
    </cfloop>

    <cfinclude template="/include/qry/report_9_282_23.cfm" />
    <cfset i = 0 />

    <!--- Loop through report 9 and process each item. --->
    <cfloop query="report_9">
        <cfoutput>
            <cfset i = #i# + 1 />
            <cfset new_reportid = "9" />
            <cfset new_label = "#report_9.label#" />
            <cfset new_itemValueInt = "#report_9.totals#" />
            <cfset new_itemDataset = "#report_9.itemDataset#" />
        </cfoutput>
        <cfinclude template="/include/Insert_ReportItem.cfm" />
    </cfloop>

    <cfinclude template="/include/qry/report_2_282_24.cfm" />
    <cfset i = 0 />

    <!--- Loop through report 2 and process each item. --->
    <cfloop query="report_2">
        <cfoutput>
            <cfset i = #i# + 1 />
            <cfset new_reportid = "2" />
            <cfset new_label = "#report_2.label#" />
            <cfset new_itemValueInt = "#report_2.totals#" />
            <cfset new_itemDataset = "#report_2.itemDataset#" />
        </cfoutput>
        <cfinclude template="/include/Insert_ReportItem.cfm" />
    </cfloop>
</cfif>

<!--- Redirect to the reports page based on the presence of an anchor tag. --->
<cfif #anchortag# is not "">
    <cflocation url="/app/reports/?refresh=n&new_audsourceidb=#new_audsourceidb#&new_audsourceid=#new_audsourceid#&customstart=#customstart#&customend=#customend#&new_rangeid=#new_rangeid#&new_audcatid=#new_audcatid####anchortag#" addtoken="false" />
<cfelse>
    <cflocation url="/app/reports/?refresh=n&new_audsourceidb=#new_audsourceidb#&new_audsourcid=#new_audsourceid#&customstart=#customstart#&customend=#customend#&new_rangeid=#new_rangeid#&new_audcatid=#new_audcatid#" addtoken="false" />
</cfif>
