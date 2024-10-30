
<cftry>
    <cfset FindLinksT = createObject("component", "services.PageAppLinkService").SELpgapplinks(pgid=findpage.pgid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindLinksT_188_8.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
