
<cftry>
    <cfset componentPath = "/services/AuditionAnswerService.cfc">
    <cfset auditionAnswerService = createObject("component", componentPath)>
    <cfset auditionAnswerService.DELaudanswers(eventid=eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in insert_41_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
