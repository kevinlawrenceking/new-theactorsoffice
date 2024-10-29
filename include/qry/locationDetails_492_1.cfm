
<cftry>
    <cfset locationDetails = createObject("component", "services.EventService").getEventDetails(audprojectid=#audprojectid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in locationDetails_492_1.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
