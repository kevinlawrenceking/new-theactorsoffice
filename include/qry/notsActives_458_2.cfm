
<cftry>
    <cfset notsActives = createObject("component", "services.NotificationService").SELfunotifications_24641(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notsActives_458_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching active notifications." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
