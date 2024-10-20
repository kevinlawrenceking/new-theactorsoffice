
<cftry>
    <cfset x = createObject("component", "/services/TagService").gettags()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_318_25.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
