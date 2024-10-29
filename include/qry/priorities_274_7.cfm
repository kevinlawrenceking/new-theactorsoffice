
<cftry>
    <cfset prioritiesService = createObject("component", "/services/TicketPriorityService")>
    <cfset priorities = prioritiesService.getTicketPriorities()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in priorities_274_7.cfm]: #cfcatch.message#"/>
    </cfcatch>
</cftry>
