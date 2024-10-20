
<cftry>
    <cfset eventContactsXRefService = new "/services/EventContactsXRefService.cfc"()>
    <cfset eventContactsXRefService.inserteventcontactsxref()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in correct_191_10.cfm]: " & cfcatch.message>
        <!--- Handle the error as needed --->
    </cfcatch>
</cftry>
