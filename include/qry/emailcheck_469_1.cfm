
<cftry>
    <cfset emailcheck = createObject("component", "services.ContactItemService").SELcontactitems_24657(currentid=#currentid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in emailcheck_469_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
