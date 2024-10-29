
<cftry>
    <cfset attendees = createObject("component", "services.EventContactsXRefService").getEventContacts(eventid=#eventid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in attendees_336_5.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
