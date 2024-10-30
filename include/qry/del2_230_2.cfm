
<cftry>
    <cfset eventService = createObject("component", "services.EventService")>
    <cfset eventService.UPDevents_24119(eventid=eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in del2_230_2.cfm] Error updating event isdeleted status. Event ID: #eventid#. Error: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the event." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
