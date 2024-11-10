<cfset systemService = createObject("component", "services.SystemService")>
<cfset addDaysNo = systemService.SELfusystems(
    new_systemid = new_systemid,
    session_userid = userid
)>