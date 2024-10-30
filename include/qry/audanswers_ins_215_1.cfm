
<cftry>
    <cfset componentPath = "/services/AuditionAnswerService.cfc">
    <cfset auditionAnswerService = createObject("component", componentPath)>
    <cfset auditionAnswerService.UPDaudanswers(
        new_qtype = new_qtype,
        new_value = new_value,
        new_answerID = new_answerID
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audanswers_ins_215_1.cfm] #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
