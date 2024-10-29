
<cftry>
    <cfset userId = /* provide the user ID here */>
    <cfset panelService = createObject("component", "/services/PanelUserService")>
    <cfset x = panelService.getPanelTitles(userId=userId)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_240_3.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
