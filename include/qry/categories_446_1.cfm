
<cftry>
    <cfset categories = createObject("component", "services.ItemCategoryService").getItemCategories(catArea_UCB="#catArea_UCB#")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in categories_446_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
