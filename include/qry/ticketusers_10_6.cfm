
<cftry>
    <cfset ticketusers = createObject("component", "services.UserService").getTicketTestUsers(ticketId=results.recid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in ticketusers_10_6.cfm]: #cfcatch.message#" type="error">
        <cfset ticketusers = queryNew("id,ticketid,userid,recordname,teststatus,rejectnotes")>
    </cfcatch>
</cftry>
