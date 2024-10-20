
<cftry>
    <cfset audmedia = createObject("component", "services.AuditionMediaService").getaudmedia(audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audmedia_384_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
