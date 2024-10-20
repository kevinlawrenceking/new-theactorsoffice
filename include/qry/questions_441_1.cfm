
<cftry>
    <cfset questions = createObject("component", "/services/AuditionQuestionUserService").getvm_audquestions_user_audanswers(eventid)>
<cfcatch>
    <cfset errorLog = "[Error in questions_441_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
