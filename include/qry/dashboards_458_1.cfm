<cftry>
    <cfset dashboards = createObject("component", "services.PanelUserService").SELpgpanels_user_24640(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in dashboards_458_1.cfm]: #cfcatch.message#">
        <cfset dashboards = queryNew("pnid,pntitle,pnColXl,pnColMd,pnFilename,new_pnorderno")>
    </cfcatch>
</cftry>

