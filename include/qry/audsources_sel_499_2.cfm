<cfset auditionSourceService = createObject("component", "services.AuditionSourceService")>
<cfset audsources_sel = auditionSourceService.SELaudsources_24684(excludeMyTeam=(myteam.recordcount EQ 0))>