
<cftry>
    <cfset dashboardzz = createObject("component", "/services/PanelUserService").getPanelsByUserId(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in dashboardzz_93_1.cfm]: #cfcatch.message#">
        <cfset dashboardzz = queryNew("pnid,pntitle,pnColXl,pnColMd,pnFilename,new_pnorderno,isvisible")>
    </cfcatch>
</cftry>
