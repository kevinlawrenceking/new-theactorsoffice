
<cftry>
    <cfset find_source = createObject("component", "/services/AuditionSourceService").getaudsources(x.audsource)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_source_308_20.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
