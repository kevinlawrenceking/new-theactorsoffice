
<cftry>
    <cfset componentPath = "/services/ContactItemService.cfc">
    <cfset contactItemService = createObject("component", componentPath)>
    <cfset result = contactItemService.insertcontactitems(
        new_contactid = new_contactid,
        valuetype = "Tags",
        valuecategory = "Tag",
        valuetext = cdtype,
        itemstatus = "Active"
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in insert_28_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>

