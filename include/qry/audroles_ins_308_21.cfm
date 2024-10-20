
<cftry>
    <cfset result = createObject("component", "/services/AuditionRoleService").insertaudroles(
        audRoleName = new_audRoleName,
        audprojectID = new_audprojectID,
        charDescription = new_charDescription,
        audSourceID = new_audSourceID,
        userid = userid,
        isDeleted = new_isDeleted,
        isBooked = isbooked,
        isCallback = isCallback,
        ispin = ispin,
        isredirect = isredirect
    )>
    <!--- Update the database to set isfetch = 1 --->
    <cfquery>
        UPDATE your_table_name SET isfetch = 1 WHERE your_condition
    </cfquery>
<cfcatch type="any">
    <cfset errorLog = "[Error in audroles_ins_308_21.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
