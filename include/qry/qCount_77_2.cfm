
<cftry>
    <cfset filteredQueryService = new services.FilteredQueryService()>
    <cfset qFiltered = filteredQueryService.getqFiltered()>
    <cfset qCount = QueryNew("total", "integer")>
    <cfset QueryAddRow(qCount, 1)>
    <cfset QuerySetCell(qCount, "total", ArrayLen(qFiltered[sIndexColumn]))>
<cfcatch type="any">
    <cfset errorLog = "[Error in qCount_77_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
