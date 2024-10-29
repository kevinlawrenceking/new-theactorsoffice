
<cftry>
    <cfset contactAuditionService = createObject("component", "/services/ContactAuditionService")>
    <cfset contactAuditionService.insertAuditionXref(contactId=0, audStepId=5)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in addmissing_33_3.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
