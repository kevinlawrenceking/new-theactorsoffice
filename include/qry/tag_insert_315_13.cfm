
<cftry>
    <cfset tag_insert = createObject("component", "/services/ContactItemService").insertcontactitems(
        contactid = tag.contactid,
        valueType = "Tags",
        valueCategory = "tag",
        valueText = new_tag2,
        itemstatus = "Active"
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tag_insert_315_13.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
