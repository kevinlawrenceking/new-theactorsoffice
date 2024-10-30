
<cftry>
    <cfset findstep = createObject("component", "services.AuditionStepService").SELaudsteps_23784(new_audstepid=new_audstepid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findstep_29_4.cfm]: #cfcatch.message#">
        <cfset findstep = queryNew("audstep")>
    </cfcatch>
</cftry>
