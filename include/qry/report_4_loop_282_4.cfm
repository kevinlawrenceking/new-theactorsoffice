
<cftry>
    <cfset report_4_loop = createObject("component", "/services/AuditionTypeService").getvm_audtypes_audsteps()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_4_loop_282_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
