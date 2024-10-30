
<cftry>
    <cfset audmedia = createObject("component", "services.AuditionMediaService").SELaudmedia_24569(audprojectid=#audprojectid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audmedia_384_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
