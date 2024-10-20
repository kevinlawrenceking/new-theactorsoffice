
<cftry>
    <cfset findcompany = createObject("component", "/services/ContactItemService").getvm_contactitems_itemcategory({
        contactID: currentid,
        valueCategory: 'Company',
        itemStatus: 'Active'
    })>
<cfcatch>
    <cfset errorLog = "[Error in findcompany_476_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
