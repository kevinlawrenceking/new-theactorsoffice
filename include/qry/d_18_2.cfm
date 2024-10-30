
<cftry>
    <cfset variables.eventService = createObject("component", "services.EventContactsXRefService")>
    <cfset variables.eventService.UPDeventcontactsxref(eventid=eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in d_18_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the event contact." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
