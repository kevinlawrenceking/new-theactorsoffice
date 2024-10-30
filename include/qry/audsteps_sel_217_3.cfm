
<cftry>
    <cfset auditionStepService = createObject("component", "services.AuditionStepService")>
    <cfset audsteps_sel = auditionStepService.SELaudsteps_24083(isDeleted=false)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audsteps_sel_217_3.cfm]: #cfcatch.message#">
        <cfset audsteps_sel = queryNew("id,NAME")>
    </cfcatch>
</cftry>
