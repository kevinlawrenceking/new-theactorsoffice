
<cftry>
    <cfset eventTypesService = new services.EventTypesService()>
    <cfset xs = eventTypesService.SELeventtypes()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in xs_318_19.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
