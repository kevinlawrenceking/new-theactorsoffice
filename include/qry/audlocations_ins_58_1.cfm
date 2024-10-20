
<cftry>
    <cfset variables.auditionRoleService = new "/services/AuditionRoleService.cfc" />
    <cfset variables.result = variables.auditionRoleService.updateaudroles(
        new_audroleid = new_audroleid,
        new_incometypeid = new_incometypeid,
        new_payrate = new_payrate,
        new_netincome = new_netincome,
        new_buyout = new_buyout,
        new_paycycleid = new_paycycleid
    ) />
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
    <!--- Additional code for updating the database goes here --->
<cfcatch type="any">
    <cfset errorLog = "[Error in audlocations_ins_58_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
