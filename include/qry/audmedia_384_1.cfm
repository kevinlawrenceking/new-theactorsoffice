
<cftry>
    <cfset audmedia = createObject("component", "services.AuditionMediaService").getMediaDetails(audprojectid=#audprojectid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audmedia_384_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
