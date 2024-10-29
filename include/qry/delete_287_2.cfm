
<cftry>
    <cfset componentPath = "/services/AuditionEssenceXRefService.cfc">
    <cfset auditionService = createObject("component", componentPath)>
    <cfset auditionService.deleteAudessencesAudtionXref(new_audroleid=new_audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_287_2.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
