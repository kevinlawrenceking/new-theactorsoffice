<cfset auditionGenreUserService = createObject("component", "services.AuditionGenreUserService")>
<cfset audgenres_audition_xref = auditionGenreUserService.SELaudgenres_user_24523(audroleid=audroleid, userid=userid)>