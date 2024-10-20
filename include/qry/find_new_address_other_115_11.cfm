
<cftry>
    <cfset find_new_address_other = createObject("component", "/services/ContactItemService").getcontactitems(
        contactid = new_contactid,
        itemstatus = "Active",
        valuecategory = "Address"
    )>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in find_new_address_other_115_11.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
