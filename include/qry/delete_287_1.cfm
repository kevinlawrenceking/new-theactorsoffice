
<cftry>
    <cfset componentPath = "/services/AuditionVocalTypeXRefService.cfc">
    <cfset auditionService = createObject("component", componentPath)>
    <cfset auditionService.DELaudvocaltypes_audition_xref(new_audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_287_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
