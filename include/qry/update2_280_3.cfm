
<cftry>
    <cfset reportRangeService = new services.ReportRangeService()>
    <cfset reportRangeService.UPDreportranges_24221(customStart=customstart, customEnd=customend)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update2_280_3.cfm] Error updating report ranges: #cfcatch.message#">
        <cfthrow message="An error occurred while updating report ranges." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
