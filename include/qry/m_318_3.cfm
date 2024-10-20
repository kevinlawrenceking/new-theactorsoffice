
<cftry>
    <cfset m = createObject("component", "services.PanelsMasterService").getpgpanels_master()>
    <cfcatch>
        <cfset errorLog = "[Error in m_318_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
