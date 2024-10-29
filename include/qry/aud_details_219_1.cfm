
<cftry>
    <cfset audRoleService = new "/services/AuditionRoleService.cfc" />
    <cfset aud_details = audRoleService.getAudRoleDetails(audroleid=#audroleid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in aud_details_219_1.cfm]: #cfcatch.message#" />
        <cfthrow message="An error occurred while fetching role details." detail="#cfcatch.detail#" />
    </cfcatch>
</cftry>
