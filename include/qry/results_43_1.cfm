
<cftry>
    <cfset results = createObject("component", "/services/EventService.cfc").getevents(audroleid=audroleid, eventid=eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in results_43_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
