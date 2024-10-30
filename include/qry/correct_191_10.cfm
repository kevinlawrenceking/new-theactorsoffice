
<cftry>
    <cfset variables.eventContactsXRefService = createObject("component", "services.EventContactsXRefService")>
    <cfset variables.eventContactsXRefService.INSeventcontactsxref_24020(audProjectID=arguments.audProjectID, audStepID=arguments.audStepID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in correct_191_10.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
