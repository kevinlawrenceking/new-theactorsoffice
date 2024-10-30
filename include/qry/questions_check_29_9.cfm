
<cftry>
    <cfset questions_check = createObject("component", "services.EventService").SELevents_23789(audprojectid=#audprojectid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in questions_check_29_9.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
