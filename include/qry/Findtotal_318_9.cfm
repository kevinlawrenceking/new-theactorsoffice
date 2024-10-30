
<cftry>
    <cfset Findtotal = createObject("component", "services.PanelUserService").SELpgpanels_user_24440(select_userid=select_userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Findtotal_318_9.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching the next order number." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
