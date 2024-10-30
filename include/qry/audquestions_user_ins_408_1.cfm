
<cftry>
    <cfset variables.auditionQuestionUserService = createObject("component", "services.AuditionQuestionUserService")>
    <cfset variables.auditionQuestionUserService.UPDaudquestions_user(
        new_qTypeID=new_qTypeID,
        new_qtext=new_qtext,
        new_qorder=new_qorder,
        new_userid=new_userid,
        new_isDeleted=new_isDeleted,
        new_qID=new_qID
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in audquestions_user_ins_408_1.cfm] #cfcatch.message#">
</cfcatch>
</cftry>
