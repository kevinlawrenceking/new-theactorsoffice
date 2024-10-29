
<cftry>
    <cfset ratio_13 = createObject("component", "/services/ReportUserService").getReportItem13(userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in ratio_13_524_12.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
