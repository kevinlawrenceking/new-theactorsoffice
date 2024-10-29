
<cftry>
    <cfset panelService = createObject("component", "/services/PanelUserService").init()>
    <cfset dashboards = panelService.getPanelsByUserId(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in dashboards_459_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching panels." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
