
<cftry>
    <cfset variables.eventService = createObject("component", "/services/EventService")>
    <cfset variables.eventService.updateEventLocation(
        new_eventLocation = trim(new_eventLocation),
        new_audlocadd1 = trim(new_audlocadd1),
        new_audlocadd2 = trim(new_audlocadd2),
        new_audcity = trim(new_audcity),
        new_region_id = new_region_id,
        new_audzip = trim(new_audzip),
        new_eventid = new_eventid
    )>
    <cfquery datasource="abod">
        UPDATE database_table SET isfetch = 1 WHERE condition
    </cfquery>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_373_2.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
