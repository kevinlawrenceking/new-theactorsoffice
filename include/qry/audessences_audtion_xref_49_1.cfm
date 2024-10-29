
<cftry>
    <cfset audessences_audtion_xref = createObject("component", "/services/EssenceService").getEssencesByRole(audroleid=roledetails.audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audessences_audtion_xref_49_1.cfm]: #cfcatch.message#">
        <cfset audessences_audtion_xref = queryNew("")>
    </cfcatch>
</cftry>
