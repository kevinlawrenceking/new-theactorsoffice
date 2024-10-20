
<cftry>
    <cfset attachdetails = createObject("component", "services.AuditionMediaService").getaudmedia(mediaid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in attachdetails_109_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
