
<cftry>
    <cfset result = createObject("component", "/services/AuditionQuestionsDefaultService").insertaudquestions_default(
        new_qTypeID = new_qTypeID,
        new_qtext = new_qtext,
        new_qorder = new_qorder,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audquestions_default_ins_405_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
