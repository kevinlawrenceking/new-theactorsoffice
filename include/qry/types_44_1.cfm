
<cftry>
    <cfset mediaTypeService = createObject("component", "services.AuditionMediaTypeService")>
    <cfset types = mediaTypeService.getMediaTypes(mediaTypeIds=[1, 2, 3, 5, 6, 7, 8])>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in types_44_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
