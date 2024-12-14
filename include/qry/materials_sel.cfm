<cfset auditionMediaService = createObject("component", "services.AuditionMediaService")>
<cfset headshots = auditionMediaService.GetMaterials(userid=userid)>