<cfset systemUserService = createObject("component", "services.SystemUserService")>
<cfset NewSUID - systemUserService.INSfusystemusers(
    new_systemid = new_systemid,
    new_contactid = new_contactid,
    new_suStartDate = new_suStartDate
)>