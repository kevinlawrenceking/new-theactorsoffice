<cfset siteTypeUserService = createObject("component", "services.SiteTypeUserService")>
<Cfif not isdefined(isvisible)><Cfset isvisible = 0 /></cfif>
<cfset result = siteTypeUserService.UPDsitetypes_user_24134(new_sitetypename=new_sitetypename, new_sitetypeid=new_sitetypeid,isvisible=isvisible) />