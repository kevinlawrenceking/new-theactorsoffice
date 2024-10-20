
<cftry>
    <cfset dashboards = createObject("component", "/services/PanelUserService").getpgpanels_user(userid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in dashboards_459_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
