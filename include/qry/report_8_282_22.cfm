
<cftry>
    <cfset report_8 = createObject("component", "/services/AuditionMediaService").getaudmedia(
        userid = userid,
        new_audcatid = new_audcatid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in report_8_282_22.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
