
<cftry>
    <cfset pgpanels = createObject("component", "services.PanelService").getPanelIds(newpnids=newpnids)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in pgpanels_460_2.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving panel IDs." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
