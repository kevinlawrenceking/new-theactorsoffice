
<cftry>
    <cfset result = createObject("component", "services.AuditionRoleService").insertaudroles(
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
        isdirect = isdirect
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in audroles_ins_39_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
