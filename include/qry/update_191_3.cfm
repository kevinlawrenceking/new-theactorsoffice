
<cftry>
    <cfset componentPath = "/services/AuditionProjectService.cfc">
    <cfset auditionProjectService = createObject("component", componentPath)>
    <cfset result = auditionProjectService.updateaudprojects(x.new_projdate, x.audprojectID)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_191_3.cfm]: " & cfcatch.message>
        <cflog text="#errorLog#" type="error">
    </cfcatch>
</cftry>
