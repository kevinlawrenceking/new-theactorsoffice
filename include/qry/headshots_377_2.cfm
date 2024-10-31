
<cftry>
    <cfset headshots = createObject("component", "services.AuditionMediaService").SELaudmedia_24573(audprojectid=#audprojectid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in headshots_377_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching media details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
