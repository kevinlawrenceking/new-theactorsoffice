
<cftry>
    <cfset auditionDetails = createObject("component", "services.AuditionProjectService").DETaudprojects_24553(eventid=eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in auditionDetails_369_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error retrieving audition details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
