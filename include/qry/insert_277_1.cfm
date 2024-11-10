<cfset objService = createObject("component", "services.AuditionToneUserService")>
<cfset objService.INSaudtones_user(tone="#Custom#", audcatid=#audcatid#, userid=#userid#)>