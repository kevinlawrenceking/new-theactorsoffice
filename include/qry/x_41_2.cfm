
<cftry>
    <cfset x = createObject("component", "services.AuditionQuestionUserService").SELaudquestions_user(userid=cookie.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_41_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
