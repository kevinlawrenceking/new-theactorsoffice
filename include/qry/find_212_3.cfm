
<cftry>
    <cfset find = createObject("component", "services.TicketTestUserService").gettickettestusers(recid, userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_212_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
