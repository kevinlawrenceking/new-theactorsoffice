
<cftry>
    <cfset variables.eventContactsXRefService = createObject("component", "services.EventContactsXRefService")>
    <cfset variables.eventContactsXRefService.INSeventcontactsxref_24532(new_eventid=new_eventid, new_contactid=new_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in inserts_365_7.cfm]: #cfcatch.message#" type="error">
        <cfthrow message="Error occurred while calling INSeventcontactsxref_24532." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
