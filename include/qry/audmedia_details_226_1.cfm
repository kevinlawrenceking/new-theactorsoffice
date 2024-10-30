
<cftry>
    <cfset audmedia_details = createObject("component", "services.AuditionMediaService").DETaudmedia_24113(mediaid=mediaid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audmedia_details_226_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving media details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
