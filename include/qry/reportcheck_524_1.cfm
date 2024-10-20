
<cftry>
    <cfset reportUserService = new "/services/ReportUserService.cfc"()>
    <cfset reportcheck = reportUserService.getreports_user(userid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in reportcheck_524_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
