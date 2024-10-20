
<cftry>
    <cfset result = createObject("component", "/services/AuditionRoleService").updateaudroles(
        new_audRoleName = new_audRoleName,
        new_opencallid = new_opencallid,
        new_audRoleTypeID = new_audRoleTypeID,
        new_charDescription = new_charDescription,
        new_audDialectID = new_audDialectID,
        new_audSourceID = new_audSourceID,
        new_contactid = (len(trim(new_contactid)) ? new_contactid : ""),
        new_submitsiteid = (len(trim(new_submitsiteid)) ? new_submitsiteid : ""),
        new_isDeleted = new_isDeleted,
        new_audRoleID = new_audRoleID
    )>
<cfcatch type="any">
    <cfset errorLog("[Error in audroles_upd_287_25.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
