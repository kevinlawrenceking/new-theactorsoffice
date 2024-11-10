<!--- This ColdFusion page fetches active and inactive contact items from the ContactItems service. --->
<cfset contactItemsService = createObject("component", "services.ContactItems")>

<!--- Fetch active contact items --->
<cfset activeCategories = contactItemsService.getActiveCategories()>

<!--- Fetch inactive contact items --->
<cfset inactiveCategories = contactItemsService.getInactiveCategories()>
