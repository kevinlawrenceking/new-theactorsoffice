
<cftry>
    <cfset variables.contactItemService = createObject("component", "services.ContactItemService")>
    <cfset variables.contactItemService.INScontactitems_24043(
        contactid = contactid,
        valuetype = trim(valuetype),
        valueCategory = valueCategory
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_199_3.cfm]: #cfcatch.message#">
        <cfthrow message="Error calling INScontactitems_24043." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
