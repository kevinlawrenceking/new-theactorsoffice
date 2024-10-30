
<cftry>
    <cfset tagsUserService = createObject("component", "services.TagsUserService")>
    <cfset tags = tagsUserService.SELtags_user_24063(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tags_203_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
