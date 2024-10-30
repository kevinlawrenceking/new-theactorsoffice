
<cftry>
    <cfset var eventService = createObject("component", "/services/EventService")>
    <cfset eventService.UPDevents_24558(
        new_eventid=new_eventid,
        eventStart=eventStart,
        eventStartTime=eventStartTime,
        eventStopTime=eventStopTime
    )>
    <cfquery datasource="abod">
        UPDATE database SET isfetch = 1 WHERE fileName = 'FInd_374_2.cfm'
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in FInd_374_2.cfm] #cfcatch.message#">
</cfcatch>
</cftry>
