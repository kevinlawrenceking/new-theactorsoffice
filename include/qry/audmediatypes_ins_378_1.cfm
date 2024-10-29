
<cftry>
    <cfset variables.auditionMediaTypeService = createObject("component", "/services/AuditionMediaTypeService")>
    <cfset variables.auditionMediaTypeService.insertMediaType(new_mediaType=new_mediaType, new_isDeleted=new_isDeleted)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audmediatypes_ins_378_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error inserting media type." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
