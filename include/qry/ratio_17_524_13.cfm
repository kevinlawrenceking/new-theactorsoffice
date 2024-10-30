
<cftry>
    <cfset ratio_17 = createObject("component", "services.ReportUserService").SELreports_user_24737(
        userId = session.userid, 
        reportId = 17
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in ratio_17_524_13.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
