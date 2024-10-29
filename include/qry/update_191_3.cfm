
<cftry>
    <cfset objService = createObject("component", "/services/AuditionProjectService")>
    <cfset objService.updateAudProjectDate(new_projdate=x.new_projdate, audprojectID=x.audprojectID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_191_3.cfm]: #cfcatch.message#"/>
        <cfrethrow/>
    </cfcatch>
</cftry>
