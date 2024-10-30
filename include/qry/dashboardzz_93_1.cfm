
<cftry>
    <cfset dashboardzz = createObject("component", "services.PanelUserService").SELpgpanels_user(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in dashboardzz_93_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
