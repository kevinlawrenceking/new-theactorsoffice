
<cftry>
    <cfset eventService = createObject("component", "services.EventService")>
    <cfset eventService.UPDevents_23731(eventid=eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_15_1.cfm] #cfcatch.message#; Event ID: #eventid#" type="error"/>
        <cfthrow message="An error occurred while updating the event." detail="#cfcatch.detail#"/>
    </cfcatch>
</cftry>
