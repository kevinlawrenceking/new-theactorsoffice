
<cftry>
    <cfset variables.panelUserService = new services.PanelUserService()>
    <cfset variables.result = variables.panelUserService.updatepgpanels_user(isvisible, pnid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in updatep_240_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
