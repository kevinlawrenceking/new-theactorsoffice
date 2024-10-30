
<cftry>
    <cfset variables.auditionStepService = new "/services/AuditionStepService.cfc"()>
    <cfset variables.auditionStepService.UPDaudsteps(
        new_audstep = new_audstep,
        new_isDeleted = new_isDeleted,
        new_audstepid = new_audstepid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audsteps_ins_420_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error updating audsteps." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
