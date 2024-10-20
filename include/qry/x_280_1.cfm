
<cftry>
    <cfset x = createObject("component", "/services/ReportRangeService").getvm_reportranges_excluded()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_280_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
