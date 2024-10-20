
<cftry>
    <cfset FindJoins = createObject("component", "/services/PageService").getpgpages(pgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindJoins_466_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
