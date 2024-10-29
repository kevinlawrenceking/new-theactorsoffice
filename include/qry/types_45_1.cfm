
<cftry>
    <cfset mediaTypeIds = [1, 2, 3, 5, 6, 7, 8, 14]>
    <cfset types = createObject("component", "/services/AuditionMediaTypeService").getMediaTypes(mediaTypeIds=mediaTypeIds)>
    <cfcatch type="any">
        <cflog type="error" text="[Error in types_45_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
