
<cftry>
    <cfset emailcheck = createObject("component", "services.ContactItemService").getActiveEmails(currentid=#currentid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in emailcheck_469_1.cfm]: #cfcatch.message#">
        <cfset emailcheck = queryNew("email")>
    </cfcatch>
</cftry>
