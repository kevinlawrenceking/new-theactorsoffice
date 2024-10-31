
<cftry>
    <cfset vers = createObject("component", "services.TicketService").SELtickets_24472()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in vers_323_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
