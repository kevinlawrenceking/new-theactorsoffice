
<cftry>
    <cfset eventService = createObject("component", "/services/EventService")>
    <cfset eventService.updateEventIsDeleted(new_eventid=new_eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in del_232_4.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the event." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
