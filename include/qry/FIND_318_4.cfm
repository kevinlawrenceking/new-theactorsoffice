
<cftry>
    <cfset FIND = createObject("component", "/services/PanelUserService").getpgpanels_user(select_userid, m.pnFilename)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FIND_318_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
