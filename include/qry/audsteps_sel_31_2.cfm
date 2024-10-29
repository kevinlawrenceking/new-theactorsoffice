
<cftry>
    <cfset audStepService = createObject("component", "services.AuditionStepService")>
    <cfset audsteps_sel = audStepService.getAudStepsByUserId(userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audsteps_sel_31_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving the steps." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
