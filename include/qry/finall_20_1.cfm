
<cftry>
    <cfset finall = createObject("component", "services.EventContactsXRefService").getEventContacts(eventId=eventresults.eventid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in finall_20_1.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
