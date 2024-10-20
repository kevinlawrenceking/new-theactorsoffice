
<cftry>
    <cfset eventContactsXRefService = new "/services/EventContactsXRefService.cfc"()>
    <cfset result = eventContactsXRefService.updateeventcontactsxref(eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in d_18_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
