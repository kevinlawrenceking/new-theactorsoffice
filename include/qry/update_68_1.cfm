
<cftry>
    <cfset objAuditionRoleService = createObject("component", "/services/AuditionRoleService")>
    <cfset objAuditionRoleService.UPDaudroles_23813(statusField=statusfield, newAudRoleId=new_audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_68_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error in update_68_1.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
