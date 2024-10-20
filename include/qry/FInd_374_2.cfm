
<cftry>
    <cfset eventService = new "/services/EventService.cfc" />
    <cfset eventService.updateevents(
        new_eventid=new_eventid, 
        eventStart=eventStart, 
        eventStartTime=eventStartTime, 
        eventStopTime=eventStopTime
    ) />
    <!--- Update the database to set isfetch = 1 --->
    <cfquery>
        UPDATE some_table SET isfetch = 1 WHERE some_condition
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in FInd_374_2.cfm]: #cfcatch.message#" />
</cfcatch>
</cftry>
