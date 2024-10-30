
<cftry>
    <cfset types = createObject("component", "services.TicketTypeService").SELtickettypes()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in types_256_2.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
