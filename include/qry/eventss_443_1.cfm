
<cftry>
    <cfset eventService = createObject("component", "/services/EventService")>
    <cfset eventss = eventService.SELevents_24618(
        sessionUserId = session.userid,
        currentId = (isDefined('currentid') ? currentid : 0)
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in eventss_443_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving event details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
