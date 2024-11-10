<cfset componentPath = "/services/AuditionDialectService.cfc">
<cfset dialectService = createObject("component", componentPath)>

<cfset dialectService.UPDauddialects(
    new_auddialect = trim(new_auddialect),
    new_audCatid = new_audCatid,
    new_isDeleted = new_isDeleted,
    new_auddialectid = new_auddialectid
)>