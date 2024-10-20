
<cftry>
    <cfset FindLinksExtra = createObject("component", "services.PageAppLinkService").getpgapplinks(findpage.pgid, 'b', 'global')>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindLinksExtra_188_10.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
