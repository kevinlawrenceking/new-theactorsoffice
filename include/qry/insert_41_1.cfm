
<cftry>
    <cfset variables.auditionAnswerService = createObject("component", "services.AuditionAnswerService")>
    <cfset variables.auditionAnswerService.deleteAudAnswersByEventId(eventid=eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in insert_41_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
