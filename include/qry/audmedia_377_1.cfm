
<cftry>
    <cfset audmedia = createObject("component", "services.AuditionMediaService").SELaudmedia_24572(audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audmedia_377_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
