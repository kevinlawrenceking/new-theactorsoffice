
<cftry>
    <cfset phonecheck = createObject("component", "services.ContactItemService").getActivePhoneNumbers(currentid=#currentid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in phonecheck_515_1.cfm]: #cfcatch.message#" />
        <cfset phonecheck = queryNew("phonenumber", "varchar") />
    </cfcatch>
</cftry>
