
<cftry>
    <cfset componentPath = "/services/TagsUserService.cfc">
    <cfset tagsUserService = createObject("component", componentPath)>
    <cfset result = tagsUserService.updatetags_user(select_userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_tags_318_28.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
