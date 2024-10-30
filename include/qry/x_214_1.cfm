
<cftry>
    <cfset x = createObject("component", "services.AuditionQuestionUserService").SELaudquestions_user_24078(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_214_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
