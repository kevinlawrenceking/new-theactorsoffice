
<cftry>
    <cfset findsource = createObject("component", "services.AuditionSourceService").getaudsources(y.audsource)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findsource_308_8.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
