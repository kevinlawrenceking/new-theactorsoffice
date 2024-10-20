
<cftry>
    <cfset getAccountInfo = createObject("component", "services.AccountsService").getaccounts(accountID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in getAccountInfo_475_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
