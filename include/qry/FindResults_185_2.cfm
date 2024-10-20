
<cftry>
    <cfset FindResults = new services.PageService().getpgpages(rpgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindResults_185_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
