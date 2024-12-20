<cfset dbug = "Y"> <!-- Set to "Y" for debugging, "N" to turn it off -->
<cfset eventService = createObject("component", "services.EventService")>
<cfset events = eventService.SELevents_24546(audroleid=audroleid)>


<cfif dbug eq "Y">
    <!-- Debugging Output -->
    <cfdump var="#events#" label="Events Query Result">
    <cfdump var="#arguments#" label="Arguments Passed">
</cfif>