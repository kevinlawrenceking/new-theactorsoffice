
<cftry>
    <cfset finde = createObject("component", "/services/EventContactsXRefService").geteventcontactsxref(ContactID, eventdetails.eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in finde_17_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
