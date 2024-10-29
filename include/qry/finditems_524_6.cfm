
<cftry>
    <cfset finditems = createObject("component", "services.ReportItemService").getReportItems(userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in finditems_524_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
