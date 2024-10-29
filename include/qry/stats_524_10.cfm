
<cftry>
    <cfset stats = createObject("component", "services.ReportUserService").getUserReports(
        userID = session.userid,
        reportTypeID = 4
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in stats_524_10.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
