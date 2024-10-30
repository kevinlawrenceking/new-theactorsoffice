
<cftry>
    <cfset variables.auditionAgeRangeXRefService = new "/services/AuditionAgeRangeXRefService.cfc" />
    <cfset variables.auditionAgeRangeXRefService.INSaudageranges_audtion_xref(new_rangeid=new_rangeid, new_audroleid=new_audroleid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_287_18.cfm]: #cfcatch.message#" />
        <cfrethrow />
    </cfcatch>
</cftry>
