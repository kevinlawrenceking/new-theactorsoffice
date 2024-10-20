
<cftry>
    <cfset find_new_address = createObject("component", "/services/ContactItemService").getcontactitems({
        valuetype: "Business",
        contactid: new_contactid,
        itemstatus: "Active",
        valuecategory: "Address"
    })>
<cfcatch>
    <cfset errorLog = "[Error in find_new_address_115_10.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
