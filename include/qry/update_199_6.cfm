
<cftry>
    <cfset result = createObject("component", "/services/ContactItemService").updatecontactitems(
        valuetext = trim(valuetext),
        valuecompany = trim(valuecompany),
        valueDepartment = trim(valueDepartment),
        valueTitle = trim(valueTitle),
        valueStreetAddress = trim(valueStreetAddress),
        valueExtendedAddress = trim(valueExtendedAddress),
        valueCity = trim(valueCity),
        new_regionname = trim(new_regionname),
        new_countryname = trim(new_countryname),
        valuePostalCode = trim(valuePostalCode),
        itemdate = itemdate,
        itemid = itemid,
        catid = catid
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in update_199_6.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
