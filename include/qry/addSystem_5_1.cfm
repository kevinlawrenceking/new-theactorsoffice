<cfset systemUserService = createObject("component", "services.SystemUserService")>
<cfset NewSUID = systemUserService.INSfusystemusers(
    systemid = systemid,
    contactid = contactid,
    userid = userid,
    suStartDate = suStartDate
)>