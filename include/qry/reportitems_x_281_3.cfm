
<cftry>
    <cfset reportitems_x = createObject("component", "/services/ReportItemService").getReportItems(userid=userid, reportid=reports.reportid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in reportitems_x_281_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
