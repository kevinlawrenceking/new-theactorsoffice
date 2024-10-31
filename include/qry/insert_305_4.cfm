
<cftry>
    <cfset contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset contactItemService.UPDCONTACTITEMS_24349(
        itemid = findsame.itemid,
        new_currentStartDate = new_currentStartDate
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_305_4.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
