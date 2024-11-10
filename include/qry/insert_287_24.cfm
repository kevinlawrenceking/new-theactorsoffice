<cfset objService = createObject("component", "services.AuditionDialectsUserService")>
<cfset objService.INSauddialects_user(
    CustomDialect = CustomDialect,
    new_catid = new_catid,
    userid = userid
)>