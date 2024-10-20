
<cftry>
    <cfset eventService = new "/services/EventService.cfc" />
    <cfset result = eventService.updateevents(
        new_eventLocation = new_eventLocation,
        new_audlocadd1 = new_audlocadd1,
        new_audlocadd2 = new_audlocadd2,
        new_audcity = new_audcity,
        new_region_id = new_region_id,
        new_audzip = new_audzip,
        new_eventid = new_eventid
    ) />
    <cfset isfetch = 1 />
<cfcatch type="any">
    <cfset errorLog = "[Error in update_367_7.cfm]: " & cfcatch.message />
</cfcatch>
</cftry>
