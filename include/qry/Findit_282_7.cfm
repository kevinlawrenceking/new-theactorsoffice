
<cftry>
    <cfset Findit = createObject("component", "services.AuditionTypeService").SELaudtypes_24234(
        audstepid = report_4_loop.audstepid,
        new_audtypeid = report_4_loop.new_audtypeid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend,
        userid = userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Findit_282_7.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching the total aud roles." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
