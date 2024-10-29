
<cftry>
    <cfset auditionProjectService = new "/services/AuditionProjectService.cfc" />
    <cfset auditionprojectDetails = auditionProjectService.getProjectDetails(audprojectid=audprojectid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in auditionprojectDetails_66_1.cfm]: #cfcatch.message#"/>
    </cfcatch>
</cftry>
