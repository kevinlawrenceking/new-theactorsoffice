
<cftry>
    <cfset systemnames = createObject("component", "/services/SystemService").getfusystems()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in systemnames_453_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
