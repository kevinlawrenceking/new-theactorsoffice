
<cftry>
    <cfset details = createObject("component", "/services/TicketService").getTicketDetails(recid=recid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_303_3.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving ticket details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
