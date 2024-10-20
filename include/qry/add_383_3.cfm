
<cftry>
    <cfset result = new services.AuditionMediaXRefService().insertaudmedia_auditions_xref(
        audprojectid = variables.audprojectid,
        mediaid = variables.new_mediaID
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in add_383_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
