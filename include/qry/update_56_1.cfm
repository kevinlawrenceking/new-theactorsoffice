
<cftry>
    <cfset objAuditionRoleService = createObject("component", "/services/AuditionRoleService")>
    <cfset objAuditionRoleService.UPDaudroles(audroleid=#audroleid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_56_1.cfm] #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
