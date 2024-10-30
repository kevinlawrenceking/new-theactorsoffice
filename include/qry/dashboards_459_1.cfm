
<cftry>
    <cfset dashboards = createObject("component", "services.PanelUserService").SELpgpanels_user_24642(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in dashboards_459_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching dashboard panels." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
