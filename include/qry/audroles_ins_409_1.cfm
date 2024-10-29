
<cftry>
    <cfset componentPath = "/services/AuditionRoleService.cfc">
    <cfset auditionRoleService = createObject("component", componentPath)>
    
    <cfset auditionRoleService.insertAudRole(
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
    
    <cfquery datasource="#application.datasource#">
        UPDATE databaseTable SET isfetch = 1 WHERE someCondition
    </cfquery>

<cfcatch>
    <cflog file="errorLog" text="[Error in audroles_ins_409_1.cfm] #cfcatch.message#"/>
</cfcatch>
</cftry>
