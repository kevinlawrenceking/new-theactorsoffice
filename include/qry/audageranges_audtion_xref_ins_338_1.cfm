
<cftry>
    <cfset variables.auditionService = new "/services/AuditionAgeRangeXRefService.cfc"()>
    <cfset variables.auditionService.UPDaudageranges_audtion_xref(
        new_audRoleID=new_audRoleID, 
        new_rangeid=new_rangeid, 
        new_id=new_id
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audageranges_audtion_xref_ins_338_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating the audition range." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
