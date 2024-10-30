
<cftry>
    <cfset labels_x = createObject("component", "services.ReportItemService").SELreportitems_24226(userid=userid, reportid=reports.reportid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in labels_x_281_5.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
