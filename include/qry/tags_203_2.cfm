
<cftry>
    <cfset tagsUserService = createObject("component", "services.TagsUserService")>
    <cfset tags = tagsUserService.getUserTags(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tags_203_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
