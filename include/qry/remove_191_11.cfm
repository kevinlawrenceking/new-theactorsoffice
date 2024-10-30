
<cftry>
    <cfset eventContactsService = new "/services/EventContactsXRefService.cfc"()>
    <cfset eventContactsService.DELeventcontactsxref(eventIds=[])>
    <cflog text="Successfully executed remove event contacts." type="information">
<cfcatch type="any">
    <cflog text="[Error in remove_191_11.cfm]: #cfcatch.message# - #cfcatch.detail#" type="error">
</cfcatch>
</cftry>
