
<cftry>
    <cfset itemsbycatActive = createObject("component", "services.ContactItemService").getActiveContactItems(
        currentid = currentid,
        activeCategoriesValueCategory = ActiveCategories.valueCategory,
        catArea_UCB = catArea_UCB
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in itemsbycatActive_490_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
