
<cftry>
    <cfset eventresults = createObject("component", "services.EventService").getevents({
        userid: session.userid,
        currentid: (isDefined("currentid") ? currentid : "")
    })>
<cfcatch>
    <cfset errorLog = "[Error in eventresults_471_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
