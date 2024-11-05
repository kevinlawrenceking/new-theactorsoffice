<!--- Create an instance of the AuditionMediaService component --->
<cfset auditionMediaService = createObject("component", "services.AuditionMediaService")>

<!--- Call the SELaudmedia_24665 function with userid and audprojectid arguments --->
<cfset headshots_sels = auditionMediaService.SELaudmedia_24665(userid=userid, audprojectid=audprojectid)>
