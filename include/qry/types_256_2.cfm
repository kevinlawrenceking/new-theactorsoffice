
<cftry>
    <cfset types = createObject("component", "services.TicketTypeService").gettickettypes()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in types_256_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
