
<cftry>
    <cfset findSystem = createObject("component", "/services/SystemService").SELfusystems_23821(newsystemscope=newsystemscope) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findSystem_71_7.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
