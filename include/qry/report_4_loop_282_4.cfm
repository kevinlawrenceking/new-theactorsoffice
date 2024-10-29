
<cftry>
    <cfset report_4_loop = createObject("component", "services.AuditionTypeService").getDynamicQuery(audstepIds=[1, 2])>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_4_loop_282_4.cfm]: #cfcatch.message#">
        <cfset report_4_loop = queryNew("")>
    </cfcatch>
</cftry>
