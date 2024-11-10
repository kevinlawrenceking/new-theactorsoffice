<cfset siteTypeUserService = createObject("component", "services.SiteTypeUserService")>
<cfset siteTypeUserService.INSsitetypes_user(new_siteTypeName=new_siteTypeName, userid=userid)>