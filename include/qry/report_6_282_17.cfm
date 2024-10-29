
<cftry>
    <cfset report_6 = createObject("component", "/services/AuditionProjectService").getAuditionData(
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend,
        userid = userid
    ) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_6_282_17.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching audition data." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
