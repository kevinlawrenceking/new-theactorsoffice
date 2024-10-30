
<cftry>
    <cfset reportsService = new "/services/ReportUserService.cfc"()>
    <cfset reports = reportsService.SELreports_user_24733(userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in reports_524_9.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
