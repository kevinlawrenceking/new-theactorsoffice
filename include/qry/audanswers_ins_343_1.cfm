
<cftry>
    <cfset result = createObject("component", "/services/AuditionAnswerService").updateaudanswers(
        new_qID = new_qID,
        new_eventid = new_eventid,
        new_aText = new_aText,
        new_aRating = new_aRating,
        new_aMemo = new_aMemo,
        new_isDeleted = new_isDeleted,
        new_answerID = new_answerID
    )>
    <cfset isfetch = 1>
    <!--- Additional code to update the database with isfetch status can be added here --->
<cfcatch type="any">
    <cfset errorLog = "[Error in audanswers_ins_343_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
