<cfset auditionProjectService = createObject("component", "services.AuditionProjectService")>


<cfparam name="audprojectids" default="" />
<cfset auditionProjectService.UPDaudprojects_24011(userid=userid, audprojectids=projectIds)>
