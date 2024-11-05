<!--- Create an instance of the AuditionMediaService component --->
<cfset auditionMediaService = createObject("component", "services.AuditionMediaService")>

<!--- Call the SELaudmedia_24677 function with userid and audprojectid arguments --->
<cfset headshots_sel = auditionMediaService.SELaudmedia_24677(userid=userid, audprojectid=audprojectid)>
