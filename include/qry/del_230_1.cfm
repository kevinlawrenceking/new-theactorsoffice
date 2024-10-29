
<cftry>
    <cfset eventService = createObject("component", "/services/EventService")>
    <cfset eventService.updateEventIsDeleted(eventid=eventid)>

    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_230_1.cfm] #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
