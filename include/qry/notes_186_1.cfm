
<cftry>
    <cfset notes = createObject("component", "/services/TicketService").getTicketDetails(recid=recid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notes_186_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error retrieving ticket details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
