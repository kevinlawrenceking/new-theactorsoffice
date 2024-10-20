
<cftry>
    <cfset auditionDetails = createObject("component", "services.AuditionProjectService").getaudprojects(eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in auditionDetails_369_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
