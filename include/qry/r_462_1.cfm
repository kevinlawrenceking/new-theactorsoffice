
<cftry>
    <cfset r = createObject("component", "services.NotificationService").SELfunotifications_24638(userID=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in r_462_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
