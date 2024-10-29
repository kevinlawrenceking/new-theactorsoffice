
<cftry>
    <cfset aud_det = createObject("component", "services.AuditionProjectService").getEventDetails(eventid=#eventid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in aud_det_221_9.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
