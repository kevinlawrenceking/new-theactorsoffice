
<cftry>
    <cfset result = createObject("component", "services.AuditionAnswerService").insertaudanswers(
        new_qID = new_qID,
        new_eventid = new_eventid,
        new_aText = new_aText,
        new_aRating = new_aRating,
        new_aMemo = new_aMemo,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cfset errorLog("[Error in audanswers_ins_342_1.cfm]: " & cfcatch.message)>
    </cfcatch>
</cftry>
