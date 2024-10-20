
<cftry>
    <cfset audageranges_audtion_xref = createObject("component", "services.AuditionAgeRangeService").getvm_audageranges_audageranges_audtion_xref(audroleid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in audageranges_audtion_xref_368_11.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
