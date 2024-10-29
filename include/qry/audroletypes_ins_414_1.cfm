
<cftry>
    <cfset variables.auditionRoleTypeService = createObject("component", "services.AuditionRoleTypeService")>
    <cfset variables.auditionRoleTypeService.updateAudRoleType(
        new_audroletype = trim(new_audroletype),
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted,
        new_audroletypeid = new_audroletypeid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audroletypes_ins_414_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating the record." detail="#cfcatch.Detail#">
    </cfcatch>
</cftry>
