
<cftry>
    <cfset result = createObject("component", "services.AuditionAgeRangeXRefService").insertaudageranges_audtion_xref(
        new_audRoleID = new_audRoleID,
        new_rangeid = new_rangeid
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audageranges_audtion_xref_ins_337_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
