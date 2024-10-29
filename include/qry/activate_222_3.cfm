
<cftry>
    <cfset eventService = createObject("component", "services.EventService")>
    <cfset eventService.updateEventIsDeleted(new_eventid=new_eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in activate_222_3.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating the event." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
