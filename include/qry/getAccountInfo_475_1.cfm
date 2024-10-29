
<cftry>
    <cfset accountService = createObject("component", "services.AccountsService")>
    <cfset getAccountInfo = accountService.getAccountById(accountID=accountID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in getAccountInfo_475_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
