
<cftry>
    <cfset variables.eventContactsXRefService = createObject("component", "/services/EventContactsXRefService")>
    <cfset variables.eventContactsXRefService.insertEventContact(new_eventid=new_eventid, new_contactid=new_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in inserts_365_7.cfm]: #cfcatch.message#" type="error">
        <cfthrow message="Error occurred while calling insertEventContact." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
