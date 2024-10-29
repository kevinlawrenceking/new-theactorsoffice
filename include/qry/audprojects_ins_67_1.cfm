
<cftry>
    <cfset variables.auditionProjectService = createObject("component", "services.AuditionProjectService")>
    <cfset variables.auditionProjectService.updateAudProject(new_audSubCatID=new_audSubCatID, new_audprojectID=new_audprojectID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audprojects_ins_67_1.cfm] #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
