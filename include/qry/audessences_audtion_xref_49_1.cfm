
<cftry>
    <cfset audessences_audtion_xref = createObject("component", "services.EssenceService").SELessences(audroleid=roledetails.audroleid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audessences_audtion_xref_49_1.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
