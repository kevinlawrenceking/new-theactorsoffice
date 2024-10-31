
<cftry>
    <cfset variables.auditionRoleService = createObject("component", "services.AuditionRoleService")>
    <cfset variables.auditionRoleService.UPDaudroles_24299(
        new_audRoleName = new_audRoleName,
        new_opencallid = new_opencallid,
        new_audRoleTypeID = new_audRoleTypeID,
        new_charDescription = new_charDescription,
        new_audDialectID = new_audDialectID,
        new_audSourceID = new_audSourceID,
        new_contactid = new_contactid,
        new_submitsiteid = new_submitsiteid,
        new_isDeleted = new_isDeleted,
        new_audRoleID = new_audRoleID
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audroles_upd_287_25.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
