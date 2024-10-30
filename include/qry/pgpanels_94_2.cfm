
<cftry>
    <cfset panelUserService = new services.PanelUserService()>
    <cfset panelUserService.UPDpgpanels_user_23858(userid=userid, new_isvisible=new_isvisible)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in pgpanels_94_2.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
