<cfset componentService = createObject("component", "services.ComponentService")>
<cfset menuItemsA = componentService.SELpgcomps(
    menuYN="Y",
    compOwner="A",
    appid="1,2"
)>