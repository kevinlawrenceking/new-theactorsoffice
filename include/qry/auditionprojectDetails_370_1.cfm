
<cftry>
    <cfset auditionprojectDetails = createObject("component", "services.AuditionProjectService").getaudprojects(audprojectid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in auditionprojectDetails_370_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
