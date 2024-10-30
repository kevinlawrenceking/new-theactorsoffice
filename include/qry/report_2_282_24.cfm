
<cftry>
    <cfset report_2 = createObject("component", "services.AuditionProjectService").SELaudprojects_24251(
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend,
        userid = userid,
        new_audcatid = new_audcatid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_2_282_24.cfm]: #cfcatch.message#">
        <cfthrow message="Error executing fetch in report_2_282_24.cfm." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
