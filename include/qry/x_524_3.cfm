
<cftry>
    <cfset x = createObject("component", "/services/ReportsMasterService").getReportsMaster()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_524_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
