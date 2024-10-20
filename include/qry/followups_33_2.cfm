
<cftry>
    <cfset followups = createObject("component", "/services/EventService").getvm_events_audprojects_sources_steps(audprojectid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in followups_33_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
