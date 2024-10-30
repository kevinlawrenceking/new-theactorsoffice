
<cftry>
    <cfset variables.auditionRoleService = createObject("component", "/services/AuditionRoleService")>
    <cfset variables.auditionRoleService.INSaudroles_24593(
        new_audRoleName = new_audRoleName,
        new_audprojectID = new_audprojectID,
        new_audRoleTypeID = new_audRoleTypeID,
        new_charDescription = new_charDescription,
        new_holdStartDate = new_holdStartDate,
        new_holdEndDate = new_holdEndDate,
        new_audDialectID = new_audDialectID,
        new_audSourceID = new_audSourceID,
        new_userid = new_userid,
        new_isDeleted = new_isDeleted,
        isbooked = isbooked,
        isCallback = isCallback,
        ispin = ispin,
        isredirect = isredirect
    )>
<cfcatch>
    <cflog file="errorLog" text="[Error in audroles_ins_409_1.cfm] #cfcatch.message#">
</cfcatch>
</cftry>
