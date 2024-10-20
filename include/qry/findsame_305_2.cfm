
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc" />
    <cfset findsame = contactItemService.getcontactitems(
        contactid = new_contactid,
        valuetype = "Tags",
        valuetext = new_tagname,
        itemstatus = "Active"
    ) />
    <cfcatch type="any">
        <cfset errorLog = "[Error in findsame_305_2.cfm]: " & cfcatch.message />
    </cfcatch>
</cftry>
