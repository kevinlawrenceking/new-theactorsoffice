
<cftry>
    <cfset z = createObject("component", "/services/AuditionProjectService").getaudprojects(userid=userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in z_191_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
