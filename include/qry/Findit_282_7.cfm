
<cftry>
    <cfset Findit = createObject("component", "/services/AuditionTypeService").getTotalAudRoles(
        audstepid = report_4_loop.audstepid,
        new_audtypeid = report_4_loop.new_audtypeid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend,
        userid = userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Findit_282_7.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching total aud roles." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
