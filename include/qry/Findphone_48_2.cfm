
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset Findphone = contactItemService.getcontactitems({
        valueCategory: "Phone",
        contactID: audcontacts.contactid,
        itemStatus: "Active",
        orderBy: "primary_YN DESC",
        limit: 1
    })>
    <cfcatch type="any">
        <cfset errorLog = "[Error in Findphone_48_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
