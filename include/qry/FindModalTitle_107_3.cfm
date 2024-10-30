
<cftry>
    <cfset FindModalTitle = createObject("component", "services.PageService").SELpgpages_23870(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindModalTitle_107_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
