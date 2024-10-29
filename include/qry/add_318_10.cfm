
<cftry>
    <cfset panelUserService = new "/services/PanelUserService.cfc"()>
    <cfset panelUserService.insertPgpanelsUser(
        new_pnTitle = new_pnTitle,
        new_pnOrderNo = Findtotal.new_pnOrderNo,
        select_userid = select_userid
    )>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in add_318_10.cfm]: #cfcatch.message#">
    <cfthrow>
</cfcatch>
</cftry>
