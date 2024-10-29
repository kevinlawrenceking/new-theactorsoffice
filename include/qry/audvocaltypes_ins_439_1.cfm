
<cftry>
    <cfset componentPath = "/services/AuditionVocalTypeService.cfc">
    <cfset vocalTypeService = createObject("component", componentPath)>
    <cfset vocalTypeService.updateVocalType(
        new_vocaltype = new_vocaltype,
        new_isDeleted = new_isDeleted,
        new_vocaltypeid = new_vocaltypeid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audvocaltypes_ins_439_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating the vocal type." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>

