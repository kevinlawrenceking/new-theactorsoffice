
<cftry>
    <cfset report_7 = createObject("component", "services.AuditionProjectService").getAuditionsData(userid, rangeselected, new_audcatid)>
    <cfcatch type="any">
        <cflog type="error" text="[Error in report_7_282_20.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
