
<cftry>
    <cfset panelUserService = new "/services/PanelUserService.cfc"()>
    <cfset panelUserService.updatepgpanels_user(find.pnid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_114_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
