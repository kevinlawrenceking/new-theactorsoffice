<cfset auditionSubmitSiteUserService = createObject("component", "services.AuditionSubmitSiteUserService")>
<cfset find_subsite = auditionSubmitSiteUserService.SELaudsubmitsites_user_24295(userid=userid, new_submitsitename=trim(new_submitsitename))>