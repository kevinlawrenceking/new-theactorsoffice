<cfset systemUserService = createObject("component", "services.SystemUserService")>
<cfset reldetails = systemUserService.DETfusystemusers(suid=suid)>