
<cftry>
    <cfset FindResults = createObject("component", "/services/PageService").getpgpages(pgid=pgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindResults_466_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
