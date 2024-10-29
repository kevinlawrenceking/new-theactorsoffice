
<cftry>
    <cfset auditionRoleService = new services.AuditionRoleService()>
    <cfset auditionRoleService.updateAudroles(audsourceid=NULL)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in submitsitefix_368_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while calling the updateAudroles function.">
    </cfcatch>
</cftry>
