<cfset contactItemService = createObject("component", "services.ContactItemService")>

<!--- Define the address struct dynamically --->
<cfparam name="form.contactid" default="0">
<cfparam name="form.address" default="">
<cfparam name="form.address_second" default="">
<cfparam name="form.city" default="">
<cfparam name="form.state" default="">
<cfparam name="form.zip" default="">
<cfparam name="form.country" default="">

<cfset address = {
    contactid = val(form.contactid), <!--- Ensure numeric value for contactid --->
    address = trim(form.address),
    address_second = trim(form.address_second),
    city = trim(form.city),
    state = trim(form.state),
    zip = trim(form.zip),
    country = trim(form.country)
}>

<!--- Validate address struct --->
<cfif NOT isStruct(address)>
    <cfthrow message="Address is not a struct." detail="The address object is invalid.">
</cfif>

<!--- Call the function --->
<cfset result = contactItemService.INScontactitems_24424(address=address)>

<!--- Output the result --->
<cfoutput>
    Insert successful! New ID: #result#
</cfoutput>

