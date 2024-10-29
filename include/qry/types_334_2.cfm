
<cftry>
    <cfset types = createObject("component", "services.EventTypesUserService").getEventTypesByUser(userid=#userid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in types_334_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
