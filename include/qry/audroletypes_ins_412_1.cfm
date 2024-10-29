
<cftry>
    <cfset variables.auditionRoleTypeService = new "/services/AuditionRoleTypeService.cfc"()>
    <cfset variables.auditionRoleTypeService.insertAudRoleType(
        new_audroletype = new_audroletype,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audroletypes_ins_412_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error calling insertAudRoleType." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
