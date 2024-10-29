
<cftry>
    <cfset variables.auditionQuestionUserService = createObject("component", "services.AuditionQuestionUserService")>
    <cfset variables.auditionQuestionUserService.updateAudQuestionsUser(
        new_qTypeID=new_qTypeID,
        new_qtext=new_qtext,
        new_qorder=new_qorder,
        new_userid=new_userid,
        new_isDeleted=new_isDeleted,
        new_qID=new_qID
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audquestions_user_ins_408_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the record." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
