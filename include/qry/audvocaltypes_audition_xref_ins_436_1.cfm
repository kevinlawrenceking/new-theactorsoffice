
<cftry>
    <cfset variables.auditionVocalTypeXRefService = createObject("component", "services.AuditionVocalTypeXRefService")>
    <cfset variables.auditionVocalTypeXRefService.updateAudVocalTypesAuditionXref(
        new_audRoleID = new_audRoleID,
        new_vocaltypeid = new_vocaltypeid,
        new_id = new_id
    )>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in audvocaltypes_audition_xref_ins_436_1.cfm]: #cfcatch.message#">
    <cfthrow message="Database update failed." detail="#cfcatch.detail#">
</cfcatch>
</cftry>
