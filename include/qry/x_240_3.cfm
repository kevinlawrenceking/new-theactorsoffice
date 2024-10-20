
<cftry>
    <cfset panelUserService = new "/services/PanelUserService.cfc" />
    <cfset x = panelUserService.getvm_pgpanels_user_sitetypes_user() />
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_240_3.cfm]: " & cfcatch.message />
    </cfcatch>
</cftry>
