
<cftry>
    <cfset componentPath = "/services/AuditionRoleService.cfc">
    <cfset auditionRoleService = createObject("component", componentPath)>
    <cfset auditionRoleService.UPDaudroles_24260(
        new_iscallback = new_iscallback,
        new_isredirect = new_isredirect,
        new_ispin = new_ispin,
        new_isbooked = new_isbooked,
        audroleid = audroleid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in update_285_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the record.">
    </cfcatch>
</cftry>
