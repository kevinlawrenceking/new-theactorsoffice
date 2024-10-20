
<cftry>
    <cfset eventService = createObject("component", "/services/EventService.cfc")>
    <cfset events = eventService.getvm_events_audroles(audroleid=audroleid, focusid=focusid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in events_424_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
