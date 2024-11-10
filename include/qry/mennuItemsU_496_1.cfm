<cfset componentService = createObject("component", "services.ComponentService")>
<cfset mennuItemsU = componentService.SELpgcomps(
    menuYN="Y",
    compOwner="U",
    appid=3
)>