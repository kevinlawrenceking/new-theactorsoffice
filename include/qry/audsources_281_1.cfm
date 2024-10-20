
<cftry>
    <cfset audsources = createObject("component", "services.AuditionSourceService").getaudsources()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audsources_281_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
