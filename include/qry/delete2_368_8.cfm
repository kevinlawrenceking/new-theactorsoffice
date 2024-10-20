
<cftry>
    <cfset var service = createObject("component", "/services/EventContactsXRefService")>
    <cfset service.updateeventcontactsxref(deletecontactid=deletecontactid, audprojectid=audprojectid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in delete2_368_8.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
