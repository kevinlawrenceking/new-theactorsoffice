<cfset auditionToneUserService = createObject("component", "services.AuditionToneUserService")>
<cfset audtones_user_sel = auditionToneUserService.SELaudtones_user(userid=userid, new_audcatid=new_audcatid)>