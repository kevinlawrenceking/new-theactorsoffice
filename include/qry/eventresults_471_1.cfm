
<cftry>
    <cfset eventresults = createObject("component", "services.EventService").RESevents_24660(
        userID = session.userid,
        currentID = isDefined("currentid") ? currentid : 0
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in eventresults_471_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
