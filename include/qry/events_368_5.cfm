
<cftry>
    <cfset events = createObject("component", "services.EventService").getvm_events_audprojects_sources_steps(audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_368_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
