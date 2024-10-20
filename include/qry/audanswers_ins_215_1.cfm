
<cftry>
    <cfset result = createObject("component", "services.AuditionAnswerService").updateaudanswers(
        new_qtype = new_qtype,
        new_value = new_value,
        new_answerID = new_answerID
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audanswers_ins_215_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
