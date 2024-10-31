
<cftry>
    <cfset categoriesService = createObject("component", "services.ItemCategoryService")>
    <cfset categories = categoriesService.SELitemcategory_24621(catArea_UCB="#catArea_UCB#")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in categories_446_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
