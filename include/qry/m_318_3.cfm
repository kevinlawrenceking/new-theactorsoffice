
<cftry>
    <cfset panelsMasterService = createObject("component", "services.PanelsMasterService")>
    <cfset m = panelsMasterService.SELpgpanels_master()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in m_318_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
