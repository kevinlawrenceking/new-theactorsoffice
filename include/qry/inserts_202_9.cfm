
<cftry>
    <cfset result = createObject("component", "/services/EventContactsXRefService").inserteventcontactsxref(eventid=eventNumber, contactid=CONTACTID)>
    <cfcatch>
        <cfset errorLog = "[Error in inserts_202_9.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
