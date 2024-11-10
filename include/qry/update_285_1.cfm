<cfset componentPath = "/services/AuditionRoleService.cfc">
<cfset auditionRoleService = createObject("component", componentPath)>
<cfset auditionRoleService.UPDaudroles_24260(
    new_iscallback = new_iscallback,
    new_isredirect = new_isredirect,
    new_ispin = new_ispin,
    new_isbooked = new_isbooked,
    audroleid = audroleid
)>