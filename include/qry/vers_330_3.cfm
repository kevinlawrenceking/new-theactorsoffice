
<cftry>
    <cfset vers = createObject("component", "/services/TicketService").getVersionDetails()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in vers_330_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
