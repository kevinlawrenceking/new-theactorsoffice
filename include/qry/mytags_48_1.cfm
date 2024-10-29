
<cftry>
    <cfset contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset mytags = contactItemService.getContactItems(contactId=audcontacts.contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in mytags_48_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
