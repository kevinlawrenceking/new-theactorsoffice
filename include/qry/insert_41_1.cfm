
<cftry>
    <cfset result = new services.AuditionAnswerService().deleteaudanswers(eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in insert_41_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
