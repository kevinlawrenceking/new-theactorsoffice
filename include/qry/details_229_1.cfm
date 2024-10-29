
<cftry>
    <cfset details = createObject("component", "services.EventService").getEventById(eventid=#eventid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_229_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
