
<cftry>
    <cfset Finddetails = createObject("component", "services.PageService").getpgpages(details_pgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in Finddetails_266_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
