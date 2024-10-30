
<cftry>
    <cfset mediaTypeService = new "/services/AuditionMediaTypeService.cfc"()>
    <cfset types = mediaTypeService.getMediaTypes(mediaTypeIds=[1, 2, 3, 5, 6, 7, 8, 14])>
    <cfcatch type="any">
        <cflog type="error" text="[Error in types_45_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
