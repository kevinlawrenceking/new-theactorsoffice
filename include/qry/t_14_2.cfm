
<cftry>
    <cfset eventService = createObject("component", "services.EventService")>
    <cfset eventService.UPDevents(newStartTime="12:00:00")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in t_14_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the event start time." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
