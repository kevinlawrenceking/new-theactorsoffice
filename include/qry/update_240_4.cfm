
<cftry>
    <cfset panelUserService = new "/services/PanelUserService.cfc"()>
    <cfset panelUserService.updatepgpanels_user(
        pntitle = x.correct_title,
        pnid = x.pnid
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_240_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
