
<cftry>
    <cfset componentPath = "/services/AuditionRoleService.cfc">
    <cfset auditionRoleService = createObject("component", componentPath)>
    <cfset result = auditionRoleService.updateaudroles(audroleid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_56_1.cfm]: " & cfcatch.message>
        <cfoutput>#errorLog#</cfoutput>
    </cfcatch>
</cftry>
