
<cftry>
    <cfset find = createObject("component", "/services/FTypeXRefService").getCFParamByType(type=x.type)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in find_292_5.cfm]: #cfcatch.message#">
        <cfset find = queryNew("cfparam")>
    </cfcatch>
</cftry>
