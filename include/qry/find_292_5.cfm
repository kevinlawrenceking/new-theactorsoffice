
<cftry>
    <cfset find = createObject("component", "services.FTypeXRefService").getftypexref(x.type)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_292_5.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
