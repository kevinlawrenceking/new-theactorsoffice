
<cftry>
    <cfset steps = createObject("component", "services.AuditionStepService").getaudsteps()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in steps_29_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
