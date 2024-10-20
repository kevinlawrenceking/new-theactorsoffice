
<cftry>
    <cfset itemsAll = createObject("component", "/services/ContactItemService").getvm_contactitems_itemcategory(currentid, catArea_UCB)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in itemsAll_489_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
