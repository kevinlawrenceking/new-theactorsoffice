
<cftry>
    <cfset var eventService = createObject("component", "services.EventService")>
    <cfset var events = eventService.getEventDetails(audroleid=#audroleid#)>
    
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_368_5.cfm]: #cfcatch.message#">
        <cfset events = queryNew("eventid,eventStart,eventstarttime,col2,col3,audtype,audlocation,col5,audstep,workwithcoach")>
    </cfcatch>
</cftry>
