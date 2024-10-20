
<cftry>
    <cfset FindJoins = createObject("component", "/services/PageService").getpgpages(pgid=pgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindJoins_526_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
