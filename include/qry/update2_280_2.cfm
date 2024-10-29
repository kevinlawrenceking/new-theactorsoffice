
<cftry>
    <cfset reportRangeService = new "/services/ReportRangeService.cfc" />
    <cfset reportRangeService.updateReportRanges(
        new_rangestart = new_rangestart,
        new_rangeend = new_rangeend,
        current_rangeid = current_rangeid
    ) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update2_280_2.cfm] #cfcatch.message#" />
        <cfthrow message="An error occurred while updating report ranges." detail="#cfcatch.detail#" />
    </cfcatch>
</cftry>
