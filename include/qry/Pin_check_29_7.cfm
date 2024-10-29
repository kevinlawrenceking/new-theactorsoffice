
<cftry>
    <cfset Pin_check = createObject("component", "services.EventService").getEvents(audroleid=#audroleid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Pin_check_29_7.cfm]: #cfcatch.message#">
        <cfset Pin_check = queryNew("")>
    </cfcatch>
</cftry>
