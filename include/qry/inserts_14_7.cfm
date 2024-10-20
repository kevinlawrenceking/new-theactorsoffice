
<cftry>
    <cfset eventContactsXRefService = new "/services/EventContactsXRefService.cfc" />
    <cfset eventContactsXRefService.inserteventcontactsxref(new_eventid, new_contactid) />
    <cfcatch type="any">
        <cfset errorLog = "[Error in inserts_14_7.cfm]: " & cfcatch.message />
    </cfcatch>
</cftry>
