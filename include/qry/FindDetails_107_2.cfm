
<cftry>
    <cfset FindDetails = createObject("component", "/services/PageService").getpgpages(compid=compid, pgid=pgid, pgfilename='results.cfm')>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindDetails_107_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
