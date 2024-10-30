
<cftry>
    <cfset ranges = createObject("component", "/services/ReportRangeService").getReportRanges({})>
    <cfcatch type="any">
        <cflog text="[Error in ranges_524_7.cfm]: #cfcatch.message#" file="errorLog">
    </cfcatch>
</cftry>
