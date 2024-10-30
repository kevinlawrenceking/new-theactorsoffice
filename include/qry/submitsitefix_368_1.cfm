
<cftry>
    <cfset componentPath = "/services/AuditionRoleService.cfc">
    <cfset auditionRoleService = createObject("component", componentPath)>
    <cfset auditionRoleService.UPDaudroles_24542(audsourceid=NULL)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in submitsitefix_368_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating the database.">
    </cfcatch>
</cftry>
