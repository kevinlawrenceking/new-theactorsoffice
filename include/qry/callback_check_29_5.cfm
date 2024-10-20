
<cftry>
    <cfset callback_check = createObject("component", "services.EventService").getevents(audroleid=audroleid, audstepid=2)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in callback_check_29_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
