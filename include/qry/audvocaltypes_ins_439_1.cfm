
<cftry>
    <cfset variables.vocalTypeService = createObject("component", "services.AuditionVocalTypeService")>
    <cfset variables.vocalTypeService.UPDaudvocaltypes(
        new_vocaltype = new_vocaltype,
        new_isDeleted = new_isDeleted,
        new_vocaltypeid = new_vocaltypeid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audvocaltypes_ins_439_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
