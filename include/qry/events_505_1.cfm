
<cftry>
    <cfset events = createObject("component", "services.EventService").SELevents_24695(sessionUserID=session.userid, contactID=rcontactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_505_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
