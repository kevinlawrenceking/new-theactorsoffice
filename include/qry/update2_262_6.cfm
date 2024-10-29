
<cftry>
    <cfset variables.contactItemService = createObject("component", "services.ContactItemService")>
    <cfset variables.contactItemService.updateContactItem(valuetype=valuetype, itemid=itemid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in update2_262_6.cfm] #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
