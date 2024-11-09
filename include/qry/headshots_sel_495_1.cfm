<!--- Ensure userid and audprojectid are defined before usage --->
<cfparam name="userid" default="">
<cfparam name="audprojectid" default="">

<!--- Create an instance of the AuditionMediaService component --->
<cfset auditionMediaService = createObject("component", "services.AuditionMediaService")>

<!--- Call the SELaudmedia_24677 function with userid and audprojectid arguments --->
<cfset headshots_sel = auditionMediaService.SELaudmedia_24677(userid=userid, audprojectid=audprojectid)>
