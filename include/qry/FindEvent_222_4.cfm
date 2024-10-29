
<cftry>
    <cfset FindEvent = createObject("component", "services.EventService").getEventDetails(new_eventid=new_eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindEvent_222_4.cfm]: #cfcatch.message#">
        <cfset FindEvent = queryNew("eventid,eventstart,eventstarttime,eventstoptime", "integer,date,time,time")>
    </cfcatch>
</cftry>
