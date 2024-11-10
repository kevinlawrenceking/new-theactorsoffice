<cfset service = createObject("component", "services.AuditionDialectService")>
<cfset service.INSauddialects(
    new_auddialect = new_auddialect,
    new_audCatid = new_audCatid,
    new_isDeleted = new_isDeleted
)>