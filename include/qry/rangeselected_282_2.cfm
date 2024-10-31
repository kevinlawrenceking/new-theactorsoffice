
<cftry>
    <cfset reportRangeService = createObject("component", "services.ReportRangeService.cfc" />
    <cfset rangeselected = reportRangeService.SELreportranges_24229(new_rangeid=new_rangeid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in rangeselected_282_2.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
