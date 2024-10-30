
<cftry>
    <cfset variables.eventService = createObject("component", "services.EventService")>
    <cfset variables.eventService.UPDevents_24118(eventid=eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_230_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
