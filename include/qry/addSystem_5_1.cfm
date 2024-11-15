<cfset systemUserService = createObject("component", "services.SystemUserService")>
<cfset NewSUID = systemUserService.INSfusystemusers_24477(
    systemid = new_systemid,
    contactid = contactid,
    userid = userid,
    suStartDate = new_suStartDate
)>