<cfset auditionMediaService = createObject("component", "services.AuditionMediaService")>
<cfset headshots_sel = auditionMediaService.SELaudmedia_24665(userid=userid, audprojectid=audprojectid)>
<cfoutput>#headshots_sel.recordcount#</cfoutput><cfaborT>