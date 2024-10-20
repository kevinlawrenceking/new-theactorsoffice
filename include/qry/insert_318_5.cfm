
<cftry>
    <cfset panelUserService = new services.PanelUserService()>
    <cfset insertResult = panelUserService.insertpgpanels_user(
        userid = select_userid,
        pnTitle = m.pntitle,
        pnFilename = m.pnfilename,
        pnOrderNo = m.pnOrderNo,
        pnColXl = m.pnColXl,
        pnColMd = m.pnColMd,
        pnDescription = m.pnDescription,
        IsVisible = 1
    )>
    <!--- Update the database to set isfetch = 1 --->
    <cfquery>
        UPDATE your_table_name SET isfetch = 1 WHERE your_condition
    </cfquery>
<cfcatch type="any">
    <cfset errorLog("[Error in insert_318_5.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
