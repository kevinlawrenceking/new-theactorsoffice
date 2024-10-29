
<cftry>
    <cfset xs = createObject("component", "/services/EventTypesService").getEventTypes()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in xs_318_19.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
