
<cftry>
    <cfset audmediaService = createObject("component", "services.AuditionMediaService")>
    <cfset audmedia = audmediaService.getMediaDetails(audprojectid=#audprojectid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audmedia_377_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
