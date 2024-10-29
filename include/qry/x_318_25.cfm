
<cftry>
    <cfset tagService = createObject("component", "/services/TagService")>
    <cfset x = tagService.getTags()>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in x_318_25.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
