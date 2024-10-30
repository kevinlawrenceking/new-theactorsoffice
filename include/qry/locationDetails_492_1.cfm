
<cftry>
    <cfset locationDetails = createObject("component", "services.EventService").DETevents_24675(audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in locationDetails_492_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
