
<cftry>
    <cfset tagsUserService = createObject("component", "services.TagsUserService")>
    <cfset tagsUserService.updateUserTags(select_userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_tags_318_28.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
