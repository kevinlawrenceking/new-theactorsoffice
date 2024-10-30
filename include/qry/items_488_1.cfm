
<cftry>
    <cfset itemsService = new services.ContactItemService()>
    <cfset items = itemsService.SELcontactitems_24671(contactID=contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in items_488_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
