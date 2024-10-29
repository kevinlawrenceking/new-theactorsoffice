
<cftry>
    <cfset auditionAgeRangeService = createObject("component", "services.AuditionAgeRangeService")>
    <cfset audageranges_audtion_xref = auditionAgeRangeService.getAgeRangesByRole(audroleid=audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audageranges_audtion_xref_368_11.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching age ranges." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
