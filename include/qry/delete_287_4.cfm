
<cftry>
    <cfset componentPath = "/services/AuditionAgeRangeXRefService.cfc">
    <cfset auditionService = createObject("component", componentPath)>
    <cfset result = auditionService.deleteaudageranges_audtion_xref(new_audroleid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in delete_287_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
