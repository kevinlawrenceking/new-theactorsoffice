
<cftry>
    <cfset auditionProjectService = createObject("component", "services.AuditionProjectService")>
    <cfset auditionprojectDetails = auditionProjectService.getAudProjectDetails(audprojectid=#audprojectid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in auditionprojectDetails_370_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving project details.">
    </cfcatch>
</cftry>
