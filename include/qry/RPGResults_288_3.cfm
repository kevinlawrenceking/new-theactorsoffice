
<cftry>
    <cfset RPGResults = createObject("component", "services.PageService").getDynamicQueryResults(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in RPGResults_288_3.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving query results." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
