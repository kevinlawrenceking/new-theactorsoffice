
<cftry>
    <cfset eventContactsXRefService = new "/services/EventContactsXRefService.cfc"()>
    <cfset inserts = eventContactsXRefService.inserteventcontactsxref(new_eventid, new_contactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in inserts_365_7.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
