
<cftry>
    <cfset labels_x = createObject("component", "/services/ReportItemService").getreportitems(userid=userid, reportid=reports.reportid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in labels_x_281_5.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
