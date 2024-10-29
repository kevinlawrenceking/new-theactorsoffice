
<cftry>
    <cfset variables.auditionService = createObject("component", "services.AuditionAgeRangeXRefService")>
    <cfset variables.auditionService.insertAuditionRangeXref(
        new_audRoleID = new_audRoleID,
        new_rangeid = new_rangeid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audageranges_audtion_xref_ins_337_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling insertAuditionRangeXref function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
