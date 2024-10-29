
<cftry>
    <cfset variables.service = new "/services/AuditionQuestionsDefaultService.cfc"()>
    <cfset variables.service.updateAudQuestionsDefault(
        new_qTypeID = new_qTypeID,
        new_qtext = new_qtext,
        new_qorder = new_qorder,
        new_isDeleted = new_isDeleted,
        new_qID = new_qID
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audquestions_default_ins_406_1.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
