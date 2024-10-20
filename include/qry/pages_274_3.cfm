
<cftry>
    <cfset pages = createObject("component", "/services/PageService").getpgpages()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in pages_274_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
