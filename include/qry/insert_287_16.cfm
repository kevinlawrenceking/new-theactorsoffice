
<cftry>
    <cfset variables.service = new "/services/AuditionVocalTypeXRefService.cfc"()>
    <cfset variables.service.INSaudvocaltypes_audition_xref(new_vocaltypeid=new_vocaltypeid, new_audroleid=new_audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_287_16.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
