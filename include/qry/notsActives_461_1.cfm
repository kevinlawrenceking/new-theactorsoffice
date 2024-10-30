
<cftry>
    <cfset notsActives = createObject("component", "services.NotificationService").SELfunotifications_24639(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notsActives_461_1.cfm] #cfcatch.message#">
        <cfthrow message="Error fetching notifications." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
