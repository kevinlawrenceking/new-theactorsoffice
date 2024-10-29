
<cftry>
    <cfset variables.auditionRoleService = new "/services/AuditionRoleService.cfc"()>
    <cfset variables.auditionRoleService.insertAudRole(
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
    <cfquery datasource="#application.datasource#">
        UPDATE database_table SET isfetch = 1 WHERE condition
    </cfquery>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audroles_ins_308_21.cfm] #cfcatch.message#, Detail: #cfcatch.detail#">
    </cfcatch>
</cftry>
