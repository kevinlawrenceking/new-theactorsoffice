
<cftry>
    <cfset aud_details = createObject("component", "services.AuditionRoleService").getaudroles(audroleid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in aud_details_217_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
