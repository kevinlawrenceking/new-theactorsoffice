<!--- Ensure userid is defined --->
<cfparam name="userid" default="">

<!--- Create an instance of the AuditionMediaService component --->
<cfset auditionMediaService = createObject("component", "services.AuditionMediaService")>

<!--- Call the SELaudmedia_24678 function with userid argument --->
<cfset headshots_sel = auditionMediaService.SELaudmedia_24678(userid=userid)>
