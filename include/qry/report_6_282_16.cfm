
<cftry>
    <cfset report_6 = createObject("component", "services.AuditionProjectService").getAuditionData(rangeselected, userid)>
    <cfcatch type="any">
        <cflog text="[Error in report_6_282_16.cfm]: #cfcatch.message#" type="error">
        <cfthrow>
    </cfcatch>
</cftry>
