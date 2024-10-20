
<cftry>
    <cfset FindDetails = createObject("component", "services.PageService").getpgpages(compid=compid, pgid=pgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindDetails_284_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
