
<cftry>
    <cfset variables.auditionAgeRangeXRefService = createObject("component", "/services/AuditionAgeRangeXRefService")>
    <cfset variables.result = variables.auditionAgeRangeXRefService.insertaudageranges_audtion_xref(new_rangeid, new_audroleid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in insert_287_18.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
