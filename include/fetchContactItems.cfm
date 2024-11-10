```ColdFusion
<!--- Fetch active and inactive contact items from the ContactItems service. --->
<cfset contactItemsService = createObject("component", "services.ContactItems")>
<cfset activeCategories = contactItemsService.getActiveCategories()>
<cfset inactiveCategories = contactItemsService.getInactiveCategories()>
<!--- Standards Applied: 5. Standardize variable names and casing. --->