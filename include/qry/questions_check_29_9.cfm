
<cftry>
    <cfset questions_check = createObject("component", "services.EventService").getEventsByProject(audprojectid=#audprojectid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in questions_check_29_9.cfm]: #cfcatch.message#" type="error">
        <cfset questions_check = queryNew("")>
    </cfcatch>
</cftry>
