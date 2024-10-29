
<cftry>
    <cfset result = createObject("component", "services.AuditionStepService").insertAudStep(
        new_audstep = new_audstep,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audsteps_ins_418_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling insertAudStep.">
    </cfcatch>
</cftry>
