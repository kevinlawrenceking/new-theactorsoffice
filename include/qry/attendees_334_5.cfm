
<cftry>
    <cfset attendees = createObject("component", "services.EventContactsXRefService").geteventcontactsxref(eventid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in attendees_334_5.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
