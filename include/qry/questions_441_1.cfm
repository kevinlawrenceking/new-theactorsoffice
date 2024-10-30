
<cftry>
    <cfset questions = createObject("component", "services.AuditionQuestionUserService").SELaudquestions_user_24501(eventid=#eventid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in questions_441_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
