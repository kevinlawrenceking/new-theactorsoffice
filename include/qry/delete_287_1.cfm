
<cftry>
    <cfset result = new services.AuditionVocalTypeXRefService().deleteaudvocaltypes_audition_xref(new_audroleid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in delete_287_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
