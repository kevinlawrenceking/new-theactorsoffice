
 
    <cfset contactItemService = createObject("component", "services.ContactItemService")>
    <cfset contactItemService.INScontactitems_24043(
        contactid = contactid,
        valuetype = trim(valuetype),
        valueCategory = valueCategory
    )>
 