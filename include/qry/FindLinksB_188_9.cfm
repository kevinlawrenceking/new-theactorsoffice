
<cftry>
    <cfset findLinksB = createObject("component", "/services/PageAppLinkService").getpgapplinks(findpage.pgid, "b")>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindLinksB_188_9.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
