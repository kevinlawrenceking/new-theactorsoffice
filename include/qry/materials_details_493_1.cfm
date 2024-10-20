
<cftry>
    <cfset materials_details = createObject("component", "/services/AuditionMediaService").getaudmedia(mediaid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in materials_details_493_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
