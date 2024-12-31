<cfset AuditionDialectsUserService = createObject("component", "services.AuditionDialectsUserService")>
<cfset AuditionDialectsUserService.INSauddialects_user(
    CustomDialect = CustomDialect,
    new_catid = new_catid,
    userid = userid
)>