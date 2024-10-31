
<cftry>
    <cfset variables.eventService = createObject("component", "services.EventService")>
    <cfset variables.eventService.UPDevents_24104(new_eventid=new_eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in activate_222_3.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while calling the UPDevents_24104 function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
