
<cftry>
    <cfset findnumber = createObject("component", "/services/EventContactsXRefService").geteventcontactsxref(eventNumber=eventNumber, contactID=CONTACTID) />
    <cfcatch type="any">
        <cfset errorLog = "[Error in findnumber_202_8.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
