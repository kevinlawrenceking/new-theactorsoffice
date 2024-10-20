
<cftry>
    <cfset updateResult = new "/services/ContactItemService"().updatecontactitems(
        valuetext = trim(valuetext),
        valuetype = trim(valuetype),
        catid = catid,
        valuecompany = trim(valuecompany),
        custom = trim(custom),
        valueDepartment = trim(valueDepartment),
        valueTitle = trim(valueTitle),
        valueStreetAddress = trim(valueStreetAddress),
        valueExtendedAddress = trim(valueExtendedAddress),
        valueCity = trim(valueCity),
        new_region_id = trim(new_region_id),
        new_countryid = trim(new_countryid),
        valuePostalCode = trim(valuePostalCode),
        itemdate = itemdate,
        deleteitem = deleteitem,
        itemid = itemid
    )>
<cfcatch type="any">
    <cfset errorLog("[Error in update_262_5.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
