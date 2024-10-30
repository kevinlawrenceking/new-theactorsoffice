
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset eventService.UPDevents_24018(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in delete_191_8.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
