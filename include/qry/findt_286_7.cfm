
<cftry>
    <cfset findt = createObject("component", "services.AuditionAgeRangeXRefService").SELaudageranges_audtion_xref(audroleid=audroleid, new_rangeid=new_rangeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findt_286_7.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving audition ranges." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
