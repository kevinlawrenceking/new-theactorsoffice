
<cftry>
    <cfset objService = createObject("component", "services.AuditionMediaTypeService")>
    <cfset objService.UPDaudmediatypes(
        new_mediaType = new_mediaType,
        new_isDeleted = new_isDeleted,
        new_mediaTypeID = new_mediaTypeID
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audmediatypes_ins_380_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the media type." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
