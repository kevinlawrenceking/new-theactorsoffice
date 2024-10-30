
<cftry>
    <cfset results = createObject("component", "services.EventService").RESevents(audroleid=audroleid, eventid=eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in results_43_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
