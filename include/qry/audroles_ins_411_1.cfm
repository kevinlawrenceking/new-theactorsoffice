
<cftry>
    <cfset componentPath = "/services/AuditionRoleService.cfc">
    <cfset auditionRoleService = createObject("component", componentPath)>
    <cfset auditionRoleService.UPDaudroles_24594(
        new_audRoleName = trim(new_audRoleName),
        new_audprojectID = new_audprojectID,
        new_audRoleTypeID = new_audRoleTypeID,
        new_charDescription = trim(new_charDescription),
        new_holdStartDate = new_holdStartDate,
        new_holdEndDate = new_holdEndDate,
        new_audDialectID = new_audDialectID,
        new_audSourceID = new_audSourceID,
        new_userid = new_userid,
        new_isDeleted = new_isDeleted,
        new_audRoleID = new_audRoleID
    )>
    <cfquery datasource="#application.datasource#">
        UPDATE database SET isfetch = 1 WHERE condition
    </cfquery>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audroles_ins_411_1.cfm] #cfcatch.message#, Detail: #cfcatch.detail#">
    </cfcatch>
</cftry>
