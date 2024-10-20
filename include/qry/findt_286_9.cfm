
<cftry>
    <cfset findt = createObject("component", "/services/AuditionVocalTypeXRefService").getaudvocaltypes_audition_xref(audroleid, new_vocaltypeid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findt_286_9.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
