
<cftry>
    <cfset audmedia_details = createObject("component", "services.AuditionMediaService").getaudmedia(mediaid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audmedia_details_226_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
