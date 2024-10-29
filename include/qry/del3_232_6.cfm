
<cftry>
    <cfset componentPath = "/services/AuditionRoleService.cfc">
    <cfset auditionRoleService = createObject("component", componentPath)>
    <cfset auditionRoleService.updateAudRoleIsDeleted(audroleid=audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del3_232_6.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating the record." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
