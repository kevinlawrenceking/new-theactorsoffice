
<cftry>
    <cfset eventsService = createObject("component", "services.AuditionProjectService")>
    <cfset events = eventsService.SELaudprojects_24062(audprojectid=#audprojectid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_203_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
