
<cftry>
    <cfset FIND = createObject("component", "services.PanelUserService").SELpgpanels_user_24435(
        userid = select_userid,
        pnFilename = m.pnFilename
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FIND_318_4.cfm]: #cfcatch.message#">
        <cfset FIND = queryNew("")>
    </cfcatch>
</cftry>
