
<cftry>
    <cfset audmedia = createObject("component", "services.AuditionMediaService").getaudmedia(eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audmedia_38_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
