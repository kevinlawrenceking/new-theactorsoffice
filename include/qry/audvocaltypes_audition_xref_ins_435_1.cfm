
<cftry>
    <cfset result = createObject("component", "services.AuditionVocalTypeXRefService").insertaudvocaltypes_audition_xref(
        new_audRoleID = new_audRoleID,
        new_vocaltypeid = new_vocaltypeid
    )>
    <cfcatch type="any">
        <cfset errorLog("[Error in audvocaltypes_audition_xref_ins_435_1.cfm]: " & cfcatch.message)>
    </cfcatch>
</cftry>
