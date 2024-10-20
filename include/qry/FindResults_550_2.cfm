
<cftry>
    <cfset FindResults = createObject("component", "services.PageService").getpgpages(rpgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindResults_550_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
