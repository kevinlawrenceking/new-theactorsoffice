<cfset accountsService = createObject("component", "services.AccountsService") />
<cfset getAccountInfo = accountsService.SELaccounts(accountID=accountID) />