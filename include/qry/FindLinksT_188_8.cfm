
<cftry>
    <cfset FindLinksT = createObject("component", "services.PageAppLinkService").getpgapplinks(findpage.pgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindLinksT_188_8.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
