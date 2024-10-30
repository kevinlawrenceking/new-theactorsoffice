
<cftry>
    <cfset tagService = new services.TagService()>
    <cfset x = tagService.SELtags()>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in x_318_25.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
