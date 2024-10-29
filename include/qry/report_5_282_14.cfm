
<cftry>
    <cfset report_5 = createObject("component", "services.AuditionProjectService").getAuditionData(
        userid = userid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_5_282_14.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching audition data." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
