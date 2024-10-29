
<cftry>
    <cfset followups = createObject("component", "services.EventService").getEventDetails(audprojectid=#audprojectid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in followups_33_2.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
