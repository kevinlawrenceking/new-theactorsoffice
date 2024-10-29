
<cftry>
    <cfset results = createObject("component", "services.BigBrotherService").getUserActivity(userId=30)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in results_375_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
