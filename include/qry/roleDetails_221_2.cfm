
<cftry>
    <cfset roleDetails = createObject("component", "/services/AuditionRoleService").getaudroles(audroleid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in roleDetails_221_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
