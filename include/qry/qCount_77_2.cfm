
<cftry>
    <cfset qCount = createObject("component", "services.FilteredQueryService").SELqFiltered(sIndexColumn=sIndexColumn)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in qCount_77_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
