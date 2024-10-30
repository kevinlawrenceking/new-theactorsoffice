
<cftry>
    <cfset variables.panelUserService = createObject("component", "services.PanelUserService")>
    <cfset variables.panelUserService.INSpgpanels_user_24436(
        select_userid = select_userid,
        m = {
            pntitle = m.pntitle,
            pnfilename = m.pnfilename,
            pnOrderNo = m.pnOrderNo,
            pnColXl = m.pnColXl,
            pnColMd = m.pnColMd,
            pnDescription = m.pnDescription
        }
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_318_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
