
<cftry>
    <cfset report_18 = createObject("component", "services.AuditionProjectService").getAuditionCounts(
        new_audsourceid = new_audsourceid,
        userid = userid,
        rangeselected = rangeselected
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_18_282_21.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
