
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset result = contactItemService.updatecontactitems(
        itemId = findsame.itemid,
        itemNotes = "Delete via Bulk Update - #new_currentStartDate#",
        isDeleted = 1
    )>
<cfcatch type="any">
    <cfset errorLog("[Error in insert_305_4.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
