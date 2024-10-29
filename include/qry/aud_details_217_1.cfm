
<cftry>
    <cfset audRoleService = createObject("component", "services.AuditionRoleService")>
    <cfset aud_details = audRoleService.getAudRoles(audroleid=#audroleid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in aud_details_217_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving roles." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
