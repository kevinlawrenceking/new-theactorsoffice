
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset result = contactItemService.updatecontactitems(currentid, 'Pending')>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_159_11.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
