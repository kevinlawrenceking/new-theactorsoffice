
<cftry>
    <cfset attendees = createObject("component", "services.EventContactsXRefService").getvm_eventcontactsxref_tbl_contactdetails(eventid)>
<cfcatch>
    <cfset errorLog = "[Error in attendees_336_5.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
