
<cftry>
    <cfset eventdetails = createObject("component", "services.EventService").DETevents_24487(eventid=#eventid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in eventdetails_334_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
