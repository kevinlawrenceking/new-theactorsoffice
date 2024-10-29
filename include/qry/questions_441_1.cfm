
<cftry>
    <cfset questions = createObject("component", "services.AuditionQuestionUserService").getQuestionsAndAnswers(eventid=eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in questions_441_1.cfm]: #cfcatch.message#">
        <cfset questions = queryNew("qid,qtext,qtypeid,qorder,answerID,eventid,aText,aRating,amemo,qtype")>
    </cfcatch>
</cftry>
