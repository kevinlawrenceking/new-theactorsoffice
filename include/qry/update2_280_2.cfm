
<cftry>
    <cfset reportRangeService = new "/services/ReportRangeService.cfc"()>
    <cfset reportRangeService.updatereportranges(new_rangestart=new_rangestart, new_rangeend=new_rangeend, current_rangeid=current_rangeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update2_280_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
