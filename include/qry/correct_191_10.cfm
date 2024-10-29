
<cftry>
    <cfset eventContactsXRefService = createObject("component", "/services/EventContactsXRefService")>
    <cfset eventContactsXRefService.insertEventContactsXref(audProjectID=24020, audStepID=5)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in correct_191_10.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
