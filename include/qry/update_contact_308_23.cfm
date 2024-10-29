
<cftry>
    <cfset componentPath = "/services/AuditionImportService.cfc">
    <cfset auditionService = createObject("component", componentPath)>
    <cfset auditionService.updateAuditionsImport(new_status=new_status, new_audprojectid=new_audprojectid, id=x.id)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in update_contact_308_23.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
