
<cftry>
    <cfset types = createObject("component", "services.AuditionMediaTypeService").SELaudmediatypes(mediaTypeIds=[9, 10, 11])>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in types_42_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while fetching media types." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
