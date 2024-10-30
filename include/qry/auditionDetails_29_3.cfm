
<cftry>
    <cfset auditionDetails = createObject("component", "services.AuditionProjectService").DETaudprojects(eventId=events.eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in auditionDetails_29_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
