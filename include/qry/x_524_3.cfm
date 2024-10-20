
<cftry>
    <cfset x = createObject("component", "/services/ReportsMasterService").getreports_master()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_524_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
