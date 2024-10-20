
<cftry>
    <cfset Findit = createObject("component", "/services/AuditionTypeService").getvm_audtypes_events_roles(
        audstepid = report_4_loop.audstepid,
        new_audtypeid = report_4_loop.new_audtypeid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend,
        userid = userid
    )>
<cfcatch type="any">
    <cfset errorLog = "[Error in Findit_282_7.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
