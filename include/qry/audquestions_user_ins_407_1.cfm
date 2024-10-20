
<cftry>
    <cfset result = createObject("component", "services.AuditionQuestionUserService").insertaudquestions_user(
        qTypeID = new_qTypeID,
        qtext = new_qtext,
        qorder = new_qorder,
        userid = new_userid,
        isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audquestions_user_ins_407_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
