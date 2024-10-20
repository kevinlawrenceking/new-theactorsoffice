
<cftry>
    <cfset eventContactsXRefService = new "/services/EventContactsXRefService.cfc"()>
    <cfset eventContactsXRefService.inserteventcontactsxref(eventid=eventid, contactid=new_contactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in inserts_18_5.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
