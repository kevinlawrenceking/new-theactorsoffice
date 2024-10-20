
<cftry>
    <cfset result = createObject("component", "services.AuditionAgeRangeXRefService").updateaudageranges_audtion_xref(
        new_audRoleID = new_audRoleID,
        new_rangeid = new_rangeid,
        new_id = new_id
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audageranges_audtion_xref_ins_338_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
