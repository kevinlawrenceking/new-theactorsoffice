
<cftry>
    <cfset variables.service = createObject("component", "/services/AuditionQuestionsDefaultService")>
    <cfset variables.service.UPDaudquestions_default(
        new_qTypeID = new_qTypeID,
        new_qtext = new_qtext,
        new_qorder = new_qorder,
        new_isDeleted = new_isDeleted,
        new_qID = new_qID
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audquestions_default_ins_406_1.cfm]: #cfcatch.message#">
        <cfthrow message="Database update failed." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
