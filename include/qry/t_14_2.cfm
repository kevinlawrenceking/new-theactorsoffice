
<cftry>
    <cfset newStartTime = "12:00:00">
    <cfset eventService = createObject("component", "/services/EventService")>
    <cfset eventService.updateEventStartTime(newStartTime=newStartTime)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in t_14_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
