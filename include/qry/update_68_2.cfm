
<cftry>
    <cfset objAuditionRoleService = createObject("component", "services.AuditionRoleService")>
    <cfset objAuditionRoleService.updateAudrolesStatus(statusField="status", newAudroleId=new_audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_68_2.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
