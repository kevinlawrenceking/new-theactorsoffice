
<cftry>
    <cfset contactItemService = createObject("component", "services.ContactItemService")>
    <cfset items = contactItemService.getActiveContactItems(contactID=contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in items_488_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
