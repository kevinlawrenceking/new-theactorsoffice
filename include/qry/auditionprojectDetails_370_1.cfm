
<cftry>
    <cfset auditionprojectDetails = createObject("component", "services.AuditionProjectService").DETaudprojects_24554(audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in auditionprojectDetails_370_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving project details.">
    </cfcatch>
</cftry>
