
<cftry>
    <cfset report_11 = createObject("component", "services.AuditionProjectService").getRedirectsData(
        userid = userid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in report_11_282_9.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
