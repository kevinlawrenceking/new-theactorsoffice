
<cftry>
    <cfset questions_check = createObject("component", "services.EventService").getvm_events_audroles(audprojectid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in questions_check_29_9.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
