
<cftry>
    <cfset variables.eventService = createObject("component", "/services/EventService")>
    <cfset variables.eventService.UPDevents_23860(recid=recid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in deleteticket_100_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
