
<cftry>
    <cfset variables.panelUserService = new "/services/PanelUserService.cfc" />
    <cfset variables.panelUserService.INSpgpanels_user(
        new_pnTitle = new_pnTitle,
        new_pnOrderNo = Findtotal.new_pnOrderNo,
        userid = userid
    ) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_249_5.cfm]: #cfcatch.message#" />
        <cfthrow message="Error occurred while adding user panel." detail="#cfcatch.detail#" />
    </cfcatch>
</cftry>
