
<cftry>
    <cfset contactItemService = createObject("component", "services.ContactItemService")>
    <cfset contactItemService.updateContactItems(
        valuetext = trim(valuetext),
        valuetype = trim(valuetype),
        catid = catid,
        valuecompany = valuecompany,
        custom = custom,
        valueDepartment = valueDepartment,
        valueTitle = valueTitle,
        valueStreetAddress = valueStreetAddress,
        valueExtendedAddress = valueExtendedAddress,
        valueCity = valueCity,
        new_region_id = new_region_id,
        new_countryid = new_countryid,
        valuePostalCode = valuePostalCode,
        itemdate = itemdate,
        deleteitem = deleteitem,
        itemid = itemid
    )>
    <cfset isfetch = 1>
<cfcatch>
    <cflog file="errorLog" text="[Error in update_262_5.cfm] Failed to update contactitems: #cfcatch.message#">
</cfcatch>
</cftry>
