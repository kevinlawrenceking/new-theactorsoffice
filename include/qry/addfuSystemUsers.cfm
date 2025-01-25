<cfset systemUserService = createObject("component", "services.SystemUserService")>
<cfset NewSUID = systemUserService.addfuSystemUsers(
    systemid = systemid,
    contactid = contactid,
    userid = userid,
    suStartDate = suStartDate
)>