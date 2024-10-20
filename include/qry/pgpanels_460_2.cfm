
<cftry>
    <cfset pgpanels = createObject("component", "/services/PanelService").getpgpanels(newpnids)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in pgpanels_460_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
