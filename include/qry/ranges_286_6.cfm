
<cftry>
    <cfset ranges = createObject("component", "services.AuditionAgeRangeService").getaudageranges()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in ranges_286_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
