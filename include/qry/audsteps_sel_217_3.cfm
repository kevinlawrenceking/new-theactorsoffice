
<cftry>
    <cfset audsteps_sel = createObject("component", "services.AuditionStepService").getaudsteps()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audsteps_sel_217_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
