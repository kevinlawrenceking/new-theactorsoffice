
<cftry>
    <cfset result = createObject("component", "/services/AuditionRoleService").updateaudroles(
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
        new_audRoleID = new_audRoleID
    )>
<cfcatch type="any">
    <cfset errorLog("[Error in audroles_ins_411_1.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
