
<cftry>
    <cfset result = createObject("component", "/services/AuditionVocalTypeXRefService").updateaudvocaltypes_audition_xref(
        new_audRoleID = new_audRoleID,
        new_vocaltypeid = new_vocaltypeid,
        new_id = new_id
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audvocaltypes_audition_xref_ins_436_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
