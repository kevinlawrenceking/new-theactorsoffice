<cfset systemService = createObject("component", "services.SystemService")>
<cfset systemid = systemService.findSystemByScope(systemscope=newsystemscope)>

 