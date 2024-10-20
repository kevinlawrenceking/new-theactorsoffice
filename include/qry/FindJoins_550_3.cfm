
<cftry>
    <cfset FindJoins = createObject("component", "/services/PageService").getpgpages(rpgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindJoins_550_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
