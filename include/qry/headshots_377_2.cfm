<!--- Create an instance of the AuditionMediaService component --->
<cfset auditionMediaService = createObject("component", "services.AuditionMediaService")>

<!--- Call the SELaudmedia_24573 function with the audprojectid argument --->
<cfset headshots = auditionMediaService.SELaudmedia_24573(audprojectid=audprojectid)>
