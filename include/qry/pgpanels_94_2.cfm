
<cftry>
    <cfset panelUserService = new "/services/PanelUserService.cfc"()>
    <cfset panelUserService.updateUserVisibility(userid=userid, new_isvisible=new_isvisible)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in pgpanels_94_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
