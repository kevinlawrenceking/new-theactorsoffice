
<cftry>
    <cfset findt = createObject("component", "/services/AuditionAgeRangeXRefService").getaudageranges_audtion_xref(audroleid, new_rangeid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in findt_286_7.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
