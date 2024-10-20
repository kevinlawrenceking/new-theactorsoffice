
<cftry>
    <cfset delete = createObject("component", "services.EventService").updateevents(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_191_8.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
