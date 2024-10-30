
<cftry>
    <cfset FindEvent = createObject("component", "services.EventService").SELevents_24105(new_eventid=new_eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindEvent_222_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
