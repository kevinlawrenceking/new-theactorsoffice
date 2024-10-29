
<cftry>
    <cfset eventService = createObject("component", "/services/EventService")>
    <cfset eventresults = eventService.getEventDetails(userID=session.userid, currentID=structKeyExists(variables, "currentid") ? currentid : 0)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in eventresults_471_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
