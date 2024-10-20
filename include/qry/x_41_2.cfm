
<cftry>
    <cfset x = createObject("component", "/services/AuditionQuestionUserService").getaudquestions_user(cookie.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_41_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
