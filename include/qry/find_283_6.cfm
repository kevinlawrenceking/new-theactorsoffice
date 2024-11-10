<cfset actionUserService = createObject("component", "services.ActionUserService")>
<cfset find = actionUserService.SELactionusers(actionid=xs.actionid, userid=u.userid)>