
<cftry>
    <cfset events = createObject("component", "services.AuditionProjectService").getDistinctEvents(audprojectid=audprojectid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_203_1.cfm]: #cfcatch.message#" />
        <cfset events = queryNew("eventid,eventstart","integer,date") />
    </cfcatch>
</cftry>
