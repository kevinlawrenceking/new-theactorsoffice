
<cftry>
    <cfset Type = createObject("component", "/services/AuditionMediaTypeService").getMediaTypes(src="account")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Type_267_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
