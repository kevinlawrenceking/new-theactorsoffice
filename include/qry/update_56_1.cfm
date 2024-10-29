
<cftry>
    <cfset auditionRoleService = new "/services/AuditionRoleService.cfc"()>
    <cfset auditionRoleService.updateAudRoleIsBooked(audroleid=#audroleid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_56_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
