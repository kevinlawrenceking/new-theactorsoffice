
<cftry>
    <cfset application.eventContactsXRefService = createObject("component", "/services/EventContactsXRefService")>
    <cfset application.eventContactsXRefService.deleteeventcontactsxref(audstepid=5)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in remove2_191_12.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
