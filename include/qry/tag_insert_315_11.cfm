
<cftry>
    <cfset tag_insert = new "/services/ContactItemService.cfc" />
    <cfset tag_insert.insertcontactitems(
        contactid = tag.contactid,
        valueType = "Tags",
        valueCategory = "tag",
        valueText = new_tag1,
        itemstatus = "Active"
    ) />
    <cfcatch type="any">
        <cfset errorLog = "[Error in tag_insert_315_11.cfm]: " & cfcatch.message />
    </cfcatch>
</cftry>
