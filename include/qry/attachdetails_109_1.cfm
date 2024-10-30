
<cftry>
    <cfset attachdetails = createObject("component", "services.AuditionMediaService").DETaudmedia(mediaid=mediaid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in attachdetails_109_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving attachment details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
