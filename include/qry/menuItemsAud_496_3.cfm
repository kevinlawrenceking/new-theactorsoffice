<cfset componentService = createObject("component", "services.ComponentService")>
<cfset menuItemsAud = componentService.SELpgcomps(
    menuYN="Y",
    compOwner="A",
    appid="3"
)>