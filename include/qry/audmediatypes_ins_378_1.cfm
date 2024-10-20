
<cftry>
    <cfset result = createObject("component", "services.AuditionMediaTypeService").insertaudmediatypes(
        mediaType = new_mediaType,
        isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audmediatypes_ins_378_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
