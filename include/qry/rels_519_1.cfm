<cfset systemUserService = createObject("component", "services.SystemUserService")>
<cfset rels = systemUserService.SELfusystemusers_24718(
    currentid = currentid,
    sessionUserId = userid
)>