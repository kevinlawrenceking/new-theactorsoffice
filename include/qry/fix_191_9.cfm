<cfset componentPath = "/services/AuditionProjectService.cfc">
<cfset objAuditionProjectService = createObject("component", componentPath)>
<cfset objAuditionProjectService.UPDaudprojects_24019(projDate="#arguments.projDate#")>