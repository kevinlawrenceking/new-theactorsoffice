
<cftry>
    <cfset details = createObject("component", "/services/TicketService").gettickets(recid=recid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in details_223_1.cfm]: " & cfcatch.message>
        <cflog file="errorLog" text="#errorLog#">
    </cfcatch>
</cftry>
