
<cftry>
    <cfset panelUserService = new services.PanelUserService()>
    <cfset panelUserService.updatepgpanels_user(userid=userid, new_isvisible=new_isvisible)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in pgpanels_94_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
