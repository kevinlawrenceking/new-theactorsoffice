
<cftry>
    <cfset variables.eventContactsXRefService = createObject("component", "/services/EventContactsXRefService.cfc")>
    <cfset variables.eventContactsXRefService.insertEventContact(eventNumber=#eventNumber#, contactID=#CONTACTID#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in inserts_202_9.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
