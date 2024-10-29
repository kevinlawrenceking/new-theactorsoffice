
<cftry>
    <cfset variables.contactItemService = createObject("component", "services.ContactItemService")>
    <cfset variables.contactItemService.updateContactItem(new_itemid=new_itemid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_159_7.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
