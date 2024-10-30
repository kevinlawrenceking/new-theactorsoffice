
<cftry>
    <cfset componentPath = "/services/AuditionAnswerService.cfc">
    <cfset auditionAnswerService = createObject("component", componentPath)>
    <cfset auditionAnswerService.INSaudanswers(qid=x.qid, eventid=eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_41_3.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
