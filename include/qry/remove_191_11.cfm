
<cftry>
    <cfset var eventContactsXRefService = createObject("component", "/services/EventContactsXRefService")>
    <cfset eventContactsXRefService.deleteInvalidEventContacts(eventIds=[])>
    <cflog text="Successfully executed remove_191_11.cfm" type="information">
<cfcatch type="any">
    <cflog text="[Error in remove_191_11.cfm]: #cfcatch.message# - #cfcatch.detail#" type="error">
</cfcatch>
</cftry>
