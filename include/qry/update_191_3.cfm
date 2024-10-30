
<cftry>
    <cfset componentPath = "/services/AuditionProjectService.cfc">
    <cfset auditionProjectService = createObject("component", componentPath)>
    <cfset auditionProjectService.UPDaudprojects_24013(new_projdate=x.new_projdate, audprojectID=x.audprojectID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_191_3.cfm]: #cfcatch.message#"/>
        <cfrethrow/>
    </cfcatch>
</cftry>
