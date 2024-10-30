
<cftry>
    <cfset callback_check = createObject("component", "services.EventService").SELevents_23785(audroleid=audroleid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in callback_check_29_5.cfm]: #cfcatch.message#">
        <cfset callback_check = queryNew("", "")>
    </cfcatch>
</cftry>
