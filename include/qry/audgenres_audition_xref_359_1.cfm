
<cftry>
    <cfset audgenres_audition_xref = createObject("component", "services.AuditionGenreUserService").getvm_audgenres_user_tbl_audgenres_audition_xref(audroleid, userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audgenres_audition_xref_359_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
