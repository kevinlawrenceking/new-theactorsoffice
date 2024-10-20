
<cftry>
    <cfset result = new "/services/ContactItemService.cfc"().insertcontactitems(
        contactID = CONTACTID,
        valueType = 'Company',
        valueCategory = 'Company',
        valueText = Company,
        itemStatus = 'Active'
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in insert_201_5.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
