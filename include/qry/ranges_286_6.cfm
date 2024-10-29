
<cftry>
    <cfset rangesService = new services.AuditionAgeRangeService()>
    <cfset ranges = rangesService.getAgeRanges(isDeleted=false)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in ranges_286_6.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
