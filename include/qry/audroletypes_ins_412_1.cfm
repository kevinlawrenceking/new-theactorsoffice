
<cftry>
    <cfset variables.auditionRoleTypeService = createObject("component", "services.AuditionRoleTypeService")>
    <cfset variables.auditionRoleTypeService.INSaudroletypes(
        new_audroletype = new_audroletype,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audroletypes_ins_412_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error calling INSaudroletypes function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
