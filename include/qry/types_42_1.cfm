<cfset auditionMediaTypeService = createObject("component", "services.AuditionMediaTypeService")>
<cfset types = auditionMediaTypeService.SELaudmediatypes(mediaTypeIds=[9, 10, 11])>