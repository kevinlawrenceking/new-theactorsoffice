<cfset contactItemService = createObject("component", "services.ContactItemService")>

<!--- Initialize an empty structure to hold parameters --->
<cfset args = {
    valuetext: trim(valuetext),
    catid: catid,
    itemid: itemid
}>


<!--- Conditionally add defined variables to the structure --->
<cfif structKeyExists(variables, "valuecompany")><cfset args.valuecompany = trim(valuecompany)></cfif>
<cfif structKeyExists(variables, "valueDepartment")><cfset args.valueDepartment = trim(valueDepartment)></cfif>
<cfif structKeyExists(variables, "valueTitle")><cfset args.valueTitle = trim(valueTitle)></cfif>
<cfif structKeyExists(variables, "valueStreetAddress")><cfset args.valueStreetAddress = trim(valueStreetAddress)></cfif>
<cfif structKeyExists(variables, "valueExtendedAddress")><cfset args.valueExtendedAddress = trim(valueExtendedAddress)></cfif>
<cfif structKeyExists(variables, "valueCity")><cfset args.valueCity = trim(valueCity)></cfif>
<cfif structKeyExists(variables, "new_regionname")><cfset args.new_regionname = trim(new_regionname)></cfif>
<cfif structKeyExists(variables, "new_countryname")><cfset args.new_countryname = trim(new_countryname)></cfif>
<cfif structKeyExists(variables, "valuePostalCode")><cfset args.valuePostalCode = trim(valuePostalCode)></cfif>
<cfif structKeyExists(variables, "itemdate") AND IsDate(itemdate)><cfset args.itemdate = itemdate></cfif>

<!--- Call the function dynamically using the argument collection --->
<cfset contactItemService.UPDcontactitems_24046(argumentCollection=args)>
