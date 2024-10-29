
<cftry>
    <cfset objAuditionAnswerService = createObject("component", "services.AuditionAnswerService")>
    <cfset objAuditionAnswerService.insertAudAnswers(
        new_qID=new_qID,
        new_eventid=new_eventid,
        new_aText=new_aText,
        new_aRating=new_aRating,
        new_aMemo=new_aMemo,
        new_isDeleted=new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audanswers_ins_342_1.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
