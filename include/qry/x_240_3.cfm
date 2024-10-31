
<cftry>
    <cfset userId = /* set the userId value appropriately */>
    <cfset panelService = createObject("component", "services.PanelUserService")>
    <cfset x = panelService.SELpgpanels_user_24136(userId=userId)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_240_3.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
