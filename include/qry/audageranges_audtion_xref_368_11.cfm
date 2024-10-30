
<cftry>
    <cfset audageranges_audtion_xref = createObject("component", "services.AuditionAgeRangeService").SELaudageranges_24552(audroleid=#audroleid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audageranges_audtion_xref_368_11.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving age ranges." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
