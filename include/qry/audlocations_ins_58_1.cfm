
<cftry>
    <cfset auditionRoleService = new "/services/AuditionRoleService.cfc"()>
    <cfset auditionRoleService.updateAudroles(
        new_audroleid = new_audroleid,
        new_incometypeid = new_incometypeid,
        new_payrate = new_payrate,
        new_netincome = new_netincome,
        new_buyout = new_buyout,
        new_paycycleid = new_paycycleid
    )>
    <cfset isfetch = 1>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audlocations_ins_58_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
