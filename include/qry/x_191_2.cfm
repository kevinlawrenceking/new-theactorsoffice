
<cftry>
    <cfset eventService = createObject("component", "/services/EventService")>
    <cfset x = eventService.getProjectDates(userid=#userid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_191_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
