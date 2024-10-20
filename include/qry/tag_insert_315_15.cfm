
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc">
    <cfset tag_insert = contactItemService.insertcontactitems(
        contactid = tag.contactid,
        valueType = "Tags",
        valueCategory = "tag",
        valueText = new_tag3,
        itemstatus = "Active"
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in tag_insert_315_15.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
