<cfset componentService = createObject("component", "services.ComponentService")>
<cfset menuItemsU = componentService.SELpgcomps(
    menuYN="Y",
    compOwner="U",
    appid="1,2"
)>
<cfset menuItemsCount = menuItemsU.recordCount>