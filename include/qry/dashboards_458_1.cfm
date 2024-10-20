
<cftry>
    <cfset dashboards = createObject("component", "/services/PanelUserService").getpgpanels_user(userid=userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in dashboards_458_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
