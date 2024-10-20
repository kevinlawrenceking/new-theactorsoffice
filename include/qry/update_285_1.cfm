
<cftry>
    <cfset result = new "/services/AuditionRoleService.cfc"().updateaudroles(
        new_iscallback = new_iscallback,
        new_isredirect = new_isredirect,
        new_ispin = new_ispin,
        new_isbooked = new_isbooked,
        audroleid = audroleid
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_285_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
