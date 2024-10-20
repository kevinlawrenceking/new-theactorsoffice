
<cftry>
    <cfset result = createObject("component", "services.AuditionQuestionsDefaultService").updateaudquestions_default(
        new_qTypeID = new_qTypeID,
        new_qtext = new_qtext,
        new_qorder = new_qorder,
        new_isDeleted = new_isDeleted,
        new_qID = new_qID
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audquestions_default_ins_406_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
