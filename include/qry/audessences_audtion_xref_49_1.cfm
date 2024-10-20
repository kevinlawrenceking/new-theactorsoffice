
<cftry>
    <cfset audessences_audtion_xref = createObject("component", "services.EssenceService").getvm_essences_audessences_audtion_xref(roledetails.audroleid)>
<cfcatch>
    <cfset errorLog = "[Error in audessences_audtion_xref_49_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
