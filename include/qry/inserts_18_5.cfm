
<cftry>
    <cfset var eventContactsXRefService = createObject("component", "services.EventContactsXRefService")>
    <cfset eventContactsXRefService.insertEventContact(eventid=eventid, new_contactid=new_contactid)>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in inserts_18_5.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling insertEventContact function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
