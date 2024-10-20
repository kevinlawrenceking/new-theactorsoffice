
<cftry>
    <cfset reportRangeService = new "/services/ReportRangeService.cfc"()>
    <cfset reportRangeService.updatereportranges(customstart, customend)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update2_280_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
