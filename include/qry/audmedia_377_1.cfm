
<cftry>
    <cfset audmedia = createObject("component", "services.AuditionMediaService").getaudmedia(audprojectid=audprojectid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audmedia_377_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
