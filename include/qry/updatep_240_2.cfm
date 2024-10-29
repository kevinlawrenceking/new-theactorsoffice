
<cftry>
    <cfset panelUserService = createObject("component", "services.PanelUserService")>
    <cfset panelUserService.updatePgpanelsUserVisibility(isvisible=isvisible, pnid=pnid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updatep_240_2.cfm] Error updating pgpanels_user visibility. Error: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the visibility." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
