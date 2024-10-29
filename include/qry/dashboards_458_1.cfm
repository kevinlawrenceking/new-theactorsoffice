
<cftry>
    <cfset dashboardService = createObject("component", "/services/PanelUserService")>
    <cfset dashboards = dashboardService.getPanelsForUser(userid=variables.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in dashboards_458_1.cfm]: #cfcatch.message#">
        <cfset dashboards = queryNew("pnid,pntitle,pnColXl,pnColMd,pnFilename,new_pnorderno")>
    </cfcatch>
</cftry>
