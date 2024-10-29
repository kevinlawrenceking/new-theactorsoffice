
<cftry>
    <cfset x = createObject("component", "services.AuditionQuestionUserService").getUserQuestions(userid=cookie.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_41_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
