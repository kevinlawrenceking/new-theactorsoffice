
<cftry>
    <cfset address_insert = new "/services/ContactItemService.cfc"().insertcontactitems(
        contactid = address.contactid,
        valueType = 'Work',
        valueCategory = 'Address',
        valuestreetaddress = address.address,
        valueextendedaddress = address.address_second,
        valuecity = address.city,
        valueregion = address.state,
        valuepostalcode = address.zip,
        valuecountry = address.country,
        itemstatus = 'Active'
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in address_insert_315_31.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
