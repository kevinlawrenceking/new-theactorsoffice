<cfparam name="audsourceid" default="0" />
<cfset componentPath = "/services/AuditionRoleService">
<cfset auditionRoleService = createObject("component", componentPath)>
<cfset auditionRoleService.UPDaudroles_24542(audsourceid)>

