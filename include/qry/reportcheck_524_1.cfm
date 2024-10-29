
<cftry>
    <cfset reportcheck = createObject("component", "services.ReportUserService").getUserReports(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in reportcheck_524_1.cfm]: #cfcatch.message#">
        <cfset reportcheck = queryNew("")>
    </cfcatch>
</cftry>
