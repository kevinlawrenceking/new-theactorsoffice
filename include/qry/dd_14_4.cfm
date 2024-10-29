
<cftry>
    <cfset eventService = createObject("component", "/services/EventService")>
    <cfset eventService.updateEventStop(eventStart=now())>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in dd_14_4.cfm]: #cfcatch.message#">
        <cfthrow message="Error calling updateEventStop" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
