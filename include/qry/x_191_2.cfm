
<cftry>
    <cfset eventService = createObject("component", "/services/EventService")>
    <cfset x = eventService.getvm_events_audroles(userid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in x_191_2.cfm]: " & cfcatch.message>
    <!--- Log the error as needed --->
</cfcatch>
</cftry>
