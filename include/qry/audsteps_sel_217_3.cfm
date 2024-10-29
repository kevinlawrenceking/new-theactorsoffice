
<cftry>
    <cfset audStepService = createObject("component", "services.AuditionStepService")>
    <cfset audsteps_sel = audStepService.getAudSteps(isDeleted=false)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audsteps_sel_217_3.cfm]: #cfcatch.message#">
        <cfset audsteps_sel = queryNew("id,NAME")>
    </cfcatch>
</cftry>
