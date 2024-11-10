<cfset componentService = createObject("component", "services.ComponentService")>
<cfset mennuItemsAud = componentService.SELpgcomps(
    menuYN="Y",
    compOwner="A",
    appid="3"
)>