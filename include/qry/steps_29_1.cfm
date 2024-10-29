
<cftry>
    <cfset steps = createObject("component", "services.AuditionStepService").getAudSteps()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in steps_29_1.cfm]: #cfcatch.message# Query: #cfcatch.detail#">
    </cfcatch>
</cftry>
