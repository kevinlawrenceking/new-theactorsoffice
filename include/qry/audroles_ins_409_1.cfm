
<cftry>
    <cfset result = createObject("component", "/services/AuditionRoleService").insertaudroles(
        audRoleName = new_audRoleName,
        audprojectID = new_audprojectID,
        audRoleTypeID = new_audRoleTypeID,
        charDescription = new_charDescription,
        holdStartDate = new_holdStartDate,
        holdEndDate = new_holdEndDate,
        audDialectID = (len(trim(new_audDialectID)) ? new_audDialectID : javaCast("null", "")),
        audSourceID = (len(trim(new_audSourceID)) ? new_audSourceID : javaCast("null", "")),
        userid = new_userid,
        isDeleted = new_isDeleted,
        isBooked = isbooked,
        isCallback = isCallback,
        ispin = ispin,
        isredirect = isredirect
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch to 1 if needed --->
<cfcatch type="any">
    <cfset errorLog("[Error in audroles_ins_409_1.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
