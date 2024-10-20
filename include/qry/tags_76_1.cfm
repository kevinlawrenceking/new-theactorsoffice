
<cftry>
    <cfset tagsUserService = new services.TagsUserService()>
    <cfset tags = tagsUserService.gettags_user(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in tags_76_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
