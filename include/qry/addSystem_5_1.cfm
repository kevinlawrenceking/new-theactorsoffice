<cfset systemUserService = createObject("component", "services.SystemUserService")>
<cfset NewSUID = systemUserService.INSfusystemusers_24477(
    systemid = systemid,
    contactid = contactid,
    userid = userid,
    suStartDate = suStartDate
)>