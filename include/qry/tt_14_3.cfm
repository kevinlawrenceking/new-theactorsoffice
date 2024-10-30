
<cftry>
    <cfset eventService = createObject("component", "services.EventService")>
    <cfset eventService.UPDevents_23725(eventStartTime=now())>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tt_14_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
