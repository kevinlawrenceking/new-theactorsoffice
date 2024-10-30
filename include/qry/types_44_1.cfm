
<cftry>
    <cfset mediaTypeIds = [1, 2, 3, 5, 6, 7, 8]>
    <cfset types = createObject("component", "services.AuditionMediaTypeService").SELaudmediatypes_23753(mediaTypeIds=mediaTypeIds)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in types_44_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
