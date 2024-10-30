
<cftry>
    <cfset auditionprojectDetails = createObject("component", "services.AuditionProjectService").DETaudprojects_23811(audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in auditionprojectDetails_66_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
