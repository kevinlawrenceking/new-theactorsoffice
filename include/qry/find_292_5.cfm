
<cftry>
    <cfset find = createObject("component", "services.FTypeXRefService").SELftypexref(type=x.type)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in find_292_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
