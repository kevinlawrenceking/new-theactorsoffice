
<cftry>
    <cfset find = createObject("component", "services.ReportUserService").getReportDetails(
        reportid = x.reportid,
        userid = u.userid,
        reportname = x.reportname
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_524_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
