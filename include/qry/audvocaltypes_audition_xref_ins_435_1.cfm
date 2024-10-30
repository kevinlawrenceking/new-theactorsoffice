
<cftry>
    <cfset componentPath = "/services/AuditionVocalTypeXRefService.cfc">
    <cfset auditionService = createObject("component", componentPath)>
    <cfset auditionService.INSaudvocaltypes_audition_xref_24613(
        new_audRoleID = new_audRoleID,
        new_vocaltypeid = new_vocaltypeid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audvocaltypes_audition_xref_ins_435_1.cfm] #cfcatch.message#" type="error">
        <cfthrow message="Error occurred while calling INSaudvocaltypes_audition_xref_24613." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>

