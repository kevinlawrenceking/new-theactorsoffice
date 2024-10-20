
<cftry>
    <cfset findstep = createObject("component", "/services/AuditionStepService").getaudsteps(new_audstepid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findstep_29_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
