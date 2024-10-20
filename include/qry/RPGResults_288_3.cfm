
<cftry>
    <cfset RPGResults = createObject("component", "/services/PageService").getpgpages(rpgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in RPGResults_288_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
