
<cftry>
    <cfset locationDetails = createObject("component", "services.EventService").getevents(audprojectid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in locationDetails_492_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
