
<cftry>
    <cfset filteredQueryService = new "/services/FilteredQueryService.cfc"()>
    <cfset qCount = filteredQueryService.getTotalCount(sIndexColumn="#sIndexColumn#")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in qCount_77_2.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
