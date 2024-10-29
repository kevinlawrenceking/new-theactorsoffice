
<cftry>
    <cfset variables.auditionQuestionUserService = createObject("component", "/services/AuditionQuestionUserService.cfc")>
    <cfset variables.auditionQuestionUserService.insertAudQuestionsUser(
        new_qTypeID = new_qTypeID,
        new_qtext = new_qtext,
        new_qorder = new_qorder,
        new_userid = new_userid,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audquestions_user_ins_407_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while inserting audquestions_user." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
