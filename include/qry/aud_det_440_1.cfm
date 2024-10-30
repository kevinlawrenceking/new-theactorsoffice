
<cftry>
    <cfset aud_det = createObject("component", "services.AuditionProjectService").SELaudprojects_24500(eventid=#eventid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in aud_det_440_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching project details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
