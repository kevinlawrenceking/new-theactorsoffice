
<cftry>
    <cfset variables.panelUserService = createObject("component", "services.PanelUserService")>
    <cfset variables.panelUserService.updatePgpanelsUser(pnid=find.pnid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_114_3.cfm]: #cfcatch.message#; SQLState: #cfcatch.sqlstate#; Error Code: #cfcatch.errorCode#">
        <cfthrow message="Database update failed." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
