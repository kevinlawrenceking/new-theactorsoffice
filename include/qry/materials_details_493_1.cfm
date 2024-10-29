
<cftry>
    <cfset materials_details = createObject("component", "/services/AuditionMediaService").getMediaDetails(mediaid=mediaid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in materials_details_493_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
