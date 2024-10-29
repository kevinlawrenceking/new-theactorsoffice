
<cftry>
    <cfset Type = createObject("component", "/services/AuditionMediaTypeService").getMediaTypes(src=src)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Type_208_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
