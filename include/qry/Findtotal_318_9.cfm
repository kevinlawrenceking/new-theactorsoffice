
<cftry>
    <cfset panelUserService = new services.PanelUserService()>
    <cfset Findtotal = panelUserService.getNewPnOrderNo(select_userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Findtotal_318_9.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching the new order number." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
