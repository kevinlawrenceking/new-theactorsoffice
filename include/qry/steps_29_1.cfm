
<cftry>
    <cfset stepsService = createObject("component", "services.AuditionStepService")>
    <cfset steps = stepsService.SELaudsteps()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in steps_29_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
