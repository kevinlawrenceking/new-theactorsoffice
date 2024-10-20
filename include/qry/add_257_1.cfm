
<cftry>
    <cfset result = new services.TicketService().inserttickets(
        pgid=0,
        verid=new_verid,
        ticketName=new_ticketName,
        ticketdetails=new_ticketdetails,
        tickettype=new_tickettype,
        userid=new_userid,
        ticketactive="Y",
        ticketstring=qstring
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
    <!--- Assuming there's a function or query to update this status --->
<cfcatch type="any">
    <cfset errorLog = "[Error in add_257_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
