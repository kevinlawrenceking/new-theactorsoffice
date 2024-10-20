
<cftry>
    <cfset itemsbycatActive = createObject("component", "/services/ContactItemService").getvm_contactitems_itemcategory(
        contactID=currentid,
        valueCategory=ActiveCategories.valueCategory,
        catArea_UCB=catArea_UCB
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in itemsbycatActive_490_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
