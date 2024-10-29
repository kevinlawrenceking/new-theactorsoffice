
<cftry>
    <cfset objService = createObject("component", "/services/AuditionAnswerService")>
    <cfset objService.insertAudAnswers(qid=x.qid, eventid=eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_41_3.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
