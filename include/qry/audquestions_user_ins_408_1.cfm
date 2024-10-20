
<cftry>
    <cfset result = createObject("component", "/services/AuditionQuestionUserService").updateaudquestions_user(
        new_qTypeID = new_qTypeID,
        new_qtext = new_qtext,
        new_qorder = new_qorder,
        new_userid = new_userid,
        new_isDeleted = new_isDeleted,
        new_qID = new_qID
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audquestions_user_ins_408_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
