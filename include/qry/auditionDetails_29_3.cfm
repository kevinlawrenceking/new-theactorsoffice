
<cftry>
    <cfset auditionService = createObject("component", "services.AuditionProjectService")>
    <cfset auditionDetails = auditionService.getEventDetails(eventId=events.eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in auditionDetails_29_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
