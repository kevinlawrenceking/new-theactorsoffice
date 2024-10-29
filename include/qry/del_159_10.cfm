
<cftry>
    <cfset variables.contactItemService = createObject("component", "services.ContactItemService")>
    <cfset variables.contactItemService.updateContactItems(itemid=itemidd, contactid=currentid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_159_10.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
