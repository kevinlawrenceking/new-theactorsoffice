
<cftry>
    <cfset objPanelUserService = createObject("component", "services.PanelUserService")>
    <cfset objPanelUserService.INSpgpanels_user_24441(
        new_pnTitle = new_pnTitle,
        new_pnOrderNo = Findtotal.new_pnOrderNo,
        select_userid = select_userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_318_10.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
