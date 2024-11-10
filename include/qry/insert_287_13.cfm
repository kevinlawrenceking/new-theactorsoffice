<cfset objService = createObject("component", "services.AuditionGenreUserService")>
<cfset objService.INSaudgenres_user(new_genre=new_genre, new_catid=new_catid, userid=userid)>