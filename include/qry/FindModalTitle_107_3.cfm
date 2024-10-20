
<cftry>
    <cfset FindModalTitle = createObject("component", "/services/PageService").getpgpages(rpgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindModalTitle_107_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
