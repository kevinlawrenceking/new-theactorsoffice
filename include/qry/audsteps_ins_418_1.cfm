
<cftry>
    <cfset result = createObject("component", "/services/AuditionStepService").insertaudsteps(
        new_audstep = new_audstep,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audsteps_ins_418_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
