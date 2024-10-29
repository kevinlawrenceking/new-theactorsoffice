
<cftry>
    <cfset findSystem = createObject("component", "services.SystemService").getSystemIdsByScope(newsystemscope="#newsystemscope#")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findSystem_71_7.cfm]: #cfcatch.message#">
        <cfset findSystem = queryNew("systemid", "integer")>
    </cfcatch>
</cftry>
