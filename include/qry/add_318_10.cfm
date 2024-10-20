
<cftry>
    <cfset add = createObject("component", "services.PanelUserService").insertpgpanels_user(
        pnTitle = new_pnTitle,
        pnFilename = "mylinks_user.cfm",
        pnOrderNo = Findtotal.new_pnOrderNo,
        pncolxl = 3,
        pncolMd = 3,
        pnDescription = "",
        IsDeleted = 0,
        IsVisible = 1,
        userid = select_userid
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in add_318_10.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
