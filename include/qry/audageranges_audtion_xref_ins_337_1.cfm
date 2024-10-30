
<cftry>
    <cfset variables.service = new /services/AuditionAgeRangeXRefService()>
    <cfset variables.service.INSaudageranges_audtion_xref_24502(
        new_audRoleID = new_audRoleID,
        new_rangeid = new_rangeid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audageranges_audtion_xref_ins_337_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling INSaudageranges_audtion_xref_24502." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
