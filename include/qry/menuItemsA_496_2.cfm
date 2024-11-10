<cfset componentService = createObject("component", "services.ComponentService")>
<cfset mennuItemsA = componentService.SELpgcomps(
    menuYN="Y",
    compOwner="A",
    appid="1,2"
)>