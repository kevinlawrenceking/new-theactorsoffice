
<cftry>
    <cfset attendeesService = new "/services/EventContactsXRefService.cfc"()>
    <cfset attendees = attendeesService.getEventContacts(eventid=#eventid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in attendees_334_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
