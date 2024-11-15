<cfset componentPath = "/services/ContactItemService">
<cfset contactItemService = createObject("component", componentPath)>
<cfset contactItemService.UPDcontactitems_24046(
    valuetext = trim(valuetext),
    catid = catid,
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
    itemid = itemid
)>