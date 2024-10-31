
<cftry>
    <cfset variables.auditionRoleService = createObject("component", "services.AuditionRoleService")>
    <cfset variables.auditionRoleService.INSaudroles_24372(
        new_audRoleName = new_audRoleName,
        new_audprojectID = new_audprojectID,
        new_charDescription = new_charDescription,
        new_audSourceID = new_audSourceID,
        userid = userid,
        new_isDeleted = new_isDeleted,
        isbooked = isbooked,
        isCallback = isCallback,
        ispin = ispin,
        isredirect = isredirect
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audroles_ins_308_21.cfm] Error: #cfcatch.message#, Detail: #cfcatch.detail#">
        <cfthrow message="[Error in audroles_ins_308_21.cfm] Database operation failed." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
