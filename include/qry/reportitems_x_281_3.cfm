
<cftry>
    <cfset reportitems_x = createObject("component", "services.ReportItemService").getreportitems(userid=userid, reportid=reports.reportid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in reportitems_x_281_3.cfm] " & cfcatch.message>
    </cfcatch>
</cftry>
