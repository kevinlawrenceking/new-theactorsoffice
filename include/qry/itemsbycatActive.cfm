<cfset contactItemService = createObject("component", "services.ContactItemService")>

<!--- Call the function and pass necessary arguments --->
<cfset itemsbycatActive = contactItemService.itemsByCatActive(
    contactid = currentid,
    valueCategory = ActiveCategories.valueCategory,
    catArea_UCB = catArea_UCB
)>