
<cftry>
    <cfset x = createObject("component", "/services/AuditionQuestionUserService").getaudquestions_user(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_214_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
