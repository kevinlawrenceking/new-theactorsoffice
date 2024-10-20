
<cftry>
    <cfset updateResult = new services.AuditionProjectService().updateaudprojects(
        projdate=z.new_projdate,
        audprojectID=z.audprojectID
    )>
    <cfcatch>
        <cfset errorLog = "[Error in update_191_7.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
