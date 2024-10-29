
<cftry>
    <cfset panelUserService = new services.PanelUserService()>
    <cfset panelUserService.insertPgPanelsUser(
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
