
<cftry>
    <cfset notsNext = createObject("component", "services.NotificationService").SELfunotifications_24713(newsuid=newsuid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notsNext_514_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
