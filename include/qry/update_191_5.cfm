
<cftry>
    <!--- This ColdFusion page updates the project date for a specific project in the audprojects table based on the provided project ID. --->
    <cfset componentPath = "/services/AuditionProjectService.cfc">
    <cfset auditionProjectService = createObject("component", componentPath)>
    <cfset result = auditionProjectService.updateaudprojects(y.new_projdate, y.audprojectID)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in update_191_5.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
