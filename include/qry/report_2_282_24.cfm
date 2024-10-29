
<cftry>
    <cfset report_2 = createObject("component", "services.AuditionProjectService").getAuditionData(
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend,
        userid = userid,
        new_audcatid = new_audcatid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_2_282_24.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching data in report_2." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
