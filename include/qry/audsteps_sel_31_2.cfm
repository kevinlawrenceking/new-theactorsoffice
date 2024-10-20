
<cftry>
    <cfset audsteps_sel = createObject("component", "services.AuditionStepService").getvm_audsteps_events(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audsteps_sel_31_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
