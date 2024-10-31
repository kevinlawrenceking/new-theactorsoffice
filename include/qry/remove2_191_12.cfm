
<cftry>
    <cfset eventContactsService = createObject("component", "/services/EventContactsXRefService")>
    <cfset result = eventContactsService.deleteEventContactsXref(audStepId=5)>
    <cfcatch type="any">
        <cflog text="[Error in remove2_191_12.cfm]: #cfcatch.message#" file="errorLog" type="error">
    </cfcatch>
</cftry>
