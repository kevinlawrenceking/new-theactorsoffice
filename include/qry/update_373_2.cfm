<cfset eventService = createObject("component", "services.EventService")>
<cfset eventService.UPDevents_24556(
    new_eventLocation = trim(new_eventLocation),
    new_audlocadd1 = trim(new_audlocadd1),
    new_audlocadd2 = trim(new_audlocadd2),
    new_audcity = trim(new_audcity),
    new_region_id = new_region_id,
    new_audzip = trim(new_audzip),
    new_eventid = new_eventid
)>
<cfquery datasource="abod">
    UPDATE events SET isfetch = 1 WHERE eventid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_eventid#">
</cfquery>