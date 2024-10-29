
<cftry>
    <cfset variables.panelUserService = createObject("component", "services.PanelUserService")>
    <cfset variables.panelUserService.insertPgpanelsUser(
        new_pnTitle = new_pnTitle,
        new_pnOrderNo = Findtotal.new_pnOrderNo,
        userid = userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_249_5.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while inserting user panel." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
