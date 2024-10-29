
<cftry>
    <cfset componentPath = "/services/AuditionVocalTypeXRefService.cfc">
    <cfset auditionVocalTypeXRefService = createObject("component", componentPath)>
    <cfset auditionVocalTypeXRefService.deleteAudVocalTypesAuditionXref(audroleid=new_audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_287_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
