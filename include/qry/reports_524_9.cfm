
<cftry>
    <cfset reportsService = createObject("component", "services.ReportUserService")>
    <cfset reports = reportsService.getUserReports(userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in reports_524_9.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
