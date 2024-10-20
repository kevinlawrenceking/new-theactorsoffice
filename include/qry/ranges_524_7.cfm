
<cftry>
    <cfset ranges = createObject("component", "services.ReportRangeService").getreportranges()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in ranges_524_7.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
