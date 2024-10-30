
<cftry>
    <cfset eventService = createObject("component", "services.EventService")>
    <cfset eventService.UPDevents_23726(eventStart=now())>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in dd_14_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
