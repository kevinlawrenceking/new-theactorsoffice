
<cftry>
    <cfset FindRefPage = createObject("component", "/services/PageService").getpgpages(ref_pgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindRefPage_135_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
