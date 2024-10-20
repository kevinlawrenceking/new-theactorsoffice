
<cftry>
    <cfset result = new "/services/AuditionStepService"().updateaudsteps(
        new_audstep = new_audstep,
        new_isDeleted = new_isDeleted,
        new_audstepid = new_audstepid
    )>
<cfcatch type="any">
    <cfset errorLog = "[Error in audsteps_ins_420_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
