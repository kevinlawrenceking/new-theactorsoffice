
<cftry>
    <cfset Findchild = createObject("component", "services.PageService").getpgpages(pgid=pgid, pgfilename='results.cfm')>
    <cfcatch type="any">
        <cfset errorLog = "[Error in Findchild_107_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
