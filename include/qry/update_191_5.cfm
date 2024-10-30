
<cftry>
    <cfset variables.auditionProjectService = createObject("component", "services.AuditionProjectService")>
    <cfset variables.auditionProjectService.UPDaudprojects_24015(new_projdate=y.new_projdate, audprojectID=y.audprojectID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_191_5.cfm]: #cfcatch.message#"/>
        <cfrethrow/>
    </cfcatch>
</cftry>
