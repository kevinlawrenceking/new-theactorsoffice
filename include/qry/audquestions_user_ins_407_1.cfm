
<cftry>
    <cfset variables.service = new "/services/AuditionQuestionUserService.cfc"()>
    <cfset variables.service.INSaudquestions_user(
        new_qTypeID = new_qTypeID,
        new_qtext = new_qtext,
        new_qorder = new_qorder,
        new_userid = new_userid,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audquestions_user_ins_407_1.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
