
<cftry>
    <cfset finditems = createObject("component", "services.ReportItemService").getreportitems(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in finditems_524_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
