
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset Pin_check = eventService.getevents(audroleid=audroleid, audstepid=4, isdeleted=0)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in Pin_check_29_7.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
