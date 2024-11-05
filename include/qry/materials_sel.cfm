<cfset auditionMediaService = createObject("component", "services.AuditionMediaService")>
<cfset headshots = auditionMediaService.GetHeadshots(userid=123)>
