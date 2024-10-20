
<cftry>
    <cfset findproject = createObject("component", "services.AuditionProjectService").getaudprojects(audprojectid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findproject_218_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
