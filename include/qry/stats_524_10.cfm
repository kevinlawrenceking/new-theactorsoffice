
<cftry>
    <cfset stats = createObject("component", "services.ReportUserService").SELreports_user_24734(
        userID = session.userid,
        reportTypeID = 4
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in stats_524_10.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
