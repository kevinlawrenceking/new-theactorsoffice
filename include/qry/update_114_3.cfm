
<cftry>
    <cfset panelUserService = createObject("component", "services.PanelUserService")>
    <cfset panelUserService.UPDpgpanels_user_23886(pnid=find.pnid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_114_3.cfm] #cfcatch.message#; SQLState: #cfcatch.sqlstate#; Error Code: #cfcatch.errorCode#">
        <cfthrow message="Database update failed." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
