
<cftry>
    <cfset reportRangeService = createObject("component", "/services/ReportRangeService")>
    <cfset rangeselected = reportRangeService.getReportRange(new_rangeid=new_rangeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in rangeselected_282_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
