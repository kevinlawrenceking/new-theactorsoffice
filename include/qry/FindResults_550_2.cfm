
<cftry>
    <cfset FindResults = createObject("component", "services.PageService").getDynamicQueryResults(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindResults_550_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving the data." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
