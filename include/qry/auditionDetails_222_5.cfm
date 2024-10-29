
<cftry>
    <cfset auditionDetails = createObject("component", "services.AuditionProjectService").getEventDetails(new_eventid=new_eventid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in auditionDetails_222_5.cfm]: #cfcatch.message#" />
        <cfset auditionDetails = queryNew("") />
    </cfcatch>
</cftry>
