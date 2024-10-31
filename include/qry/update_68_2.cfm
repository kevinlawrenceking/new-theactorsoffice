
<cftry>
    <cfset objAuditionRoleService = createObject("component", "services.AuditionRoleService")>
    <cfset objAuditionRoleService.UPDaudroles_23814(statusField="#statusfield#", newAudroleId="#new_audroleid#")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_68_2.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling UPDaudroles_23814." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
