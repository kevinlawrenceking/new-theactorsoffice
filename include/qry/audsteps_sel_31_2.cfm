
<cftry>
    <cfset audsteps_sel = createObject("component", "services.AuditionStepService").SELaudsteps_23792(userid=userid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audsteps_sel_31_2.cfm]: #cfcatch.message# Query: #cfcatch.detail#" />
        <cfthrow message="An error occurred while retrieving the steps." detail="#cfcatch.detail#" />
    </cfcatch>
</cftry>
