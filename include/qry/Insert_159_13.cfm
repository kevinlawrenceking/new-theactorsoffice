
<cftry>
    <cfset variables.contactItemService = createObject("component", "services.ContactItemService")>
    <cfset variables.contactItemService.INScontactitems_23955(
        contactID = currentid,
        valueTypeDef = categories.valueTypeDef,
        valuecategory = categories.valuecategory
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Insert_159_13.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
