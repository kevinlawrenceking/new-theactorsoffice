
<cftry>
    <cfset FindResults = createObject("component", "/services/PageService").getpgpages(pgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindResults_526_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
