<cfset panelUserService = createObject("component", "services.PanelUserService") />

<cfset panelUserService.INSpgpanels_user(
    new_pnTitle = new_pnTitle,
    new_pnOrderNo = Findtotal.new_pnOrderNo,
    userid = userid
) />