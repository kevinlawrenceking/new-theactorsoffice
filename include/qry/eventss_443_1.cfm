
<cftry>
    <cfset eventService = new "/services/EventService.cfc" />
    <cfset eventss = eventService.getvm_events_eventtypes_user(
        userId=session.userid,
        contactId=structKeyExists(variables, "currentid") ? currentid : 0
    ) />
<cfcatch type="any">
    <cfset errorLog = "[Error in eventss_443_1.cfm]: " & cfcatch.message />
</cfcatch>
</cftry>
