<cfset eventService = createObject("component", "services.EventService")>
<cfset eventService.UPDevents_24558(
    new_eventid=new_eventid,
    eventStart=eventStart,
    eventStartTime=eventStartTime,
    eventStopTime=eventStopTime
)>
<cfquery result="result" datasource="abod">
    UPDATE database SET isfetch = 1 WHERE fileName = 'FInd_374_2.cfm'
</cfquery>