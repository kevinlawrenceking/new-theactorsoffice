
<cftry>
    <cfset RPGFields = createObject("component", "/services/PageService").getpgpages(rpgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in RPGFields_288_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
