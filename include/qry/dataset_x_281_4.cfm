
<cftry>
    <cfset dataset_x = createObject("component", "/services/ReportItemService").getreportitems(userid=userid, reportid=reports.reportid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in dataset_x_281_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
