<cfset objService = createObject("component", "services.AuditionMediaXRefService")>
<cfset objService.DELaudmedia_auditions_xref(mediaid=mediaid, audprojectid=audprojectid)>