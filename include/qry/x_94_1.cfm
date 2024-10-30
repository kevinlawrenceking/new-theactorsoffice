
<!--- This ColdFusion page updates the visibility status of a user in the pgpanels_user table. --->
<cftry>
    <cfset panelUserService = createObject("component", "services.PanelUserService")>
    <cfset panelUserService.UPDpgpanels_user(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in x_94_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating user visibility." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
