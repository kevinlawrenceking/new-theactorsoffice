
<cftry>
    <cfset dashboardzz = createObject("component", "services.PanelUserService").getpgpanels_user(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in dashboardzz_93_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
