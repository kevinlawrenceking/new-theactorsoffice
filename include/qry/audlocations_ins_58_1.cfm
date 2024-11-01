
<cftry>
    <cfset componentPath = "/services/AuditionRoleService.cfc">
    <cfset auditionRoleService = createObject("component", componentPath)>
    <cfset auditionRoleService.UPDaudroles_23810(
        new_audroleid = new_audroleid,
        new_incometypeid = new_incometypeid,
        new_payrate = new_payrate,
        new_netincome = new_netincome,
        new_buyout = new_buyout,
        new_paycycleid = new_paycycleid
    )>
    <cfquery datasource="#abod#">
        UPDATE audlocations_ins SET isfetch = 1 WHERE id = 58;
    </cfquery>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audlocations_ins_58_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
