
<cftry>
    <cfset var pgid = #pgid#>
    <cfset var FindJoins = createObject("component", "services.PageService").getDynamicQueryResults(pgid=pgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindJoins_466_3.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching the query results." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
