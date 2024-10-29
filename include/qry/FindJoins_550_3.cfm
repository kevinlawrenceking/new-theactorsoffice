
<cftry>
    <cfset FindJoins = createObject("component", "services.PageService").getDynamicQueryResults(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindJoins_550_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
