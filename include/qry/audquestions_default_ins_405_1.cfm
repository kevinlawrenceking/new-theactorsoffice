
<cftry>
    <cfset variables.auditionQuestionsService = createObject("component", "/services/AuditionQuestionsDefaultService")>
    <cfset variables.auditionQuestionsService.insertAudQuestionsDefault(
        new_qTypeID = new_qTypeID,
        new_qtext = new_qtext,
        new_qorder = new_qorder,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audquestions_default_ins_405_1.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
