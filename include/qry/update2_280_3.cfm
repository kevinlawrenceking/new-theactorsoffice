
<cftry>
    <cfset reportRangeService = new services.ReportRangeService()>
    <cfset reportRangeService.updateReportRanges(customStart=customstart, customEnd=customend)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update2_280_3.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating report ranges." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
