
<cftry>
    <cfset reportRangeService = createObject("component", "/services/ReportRangeService")>
    <cfset x = reportRangeService.getReportRanges(excludedRangeIds=[1, 7])>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_280_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
