
<cftry>
    <cfset tagsUserService = createObject("component", "/services/TagsUserService")>
    <cfset tags = tagsUserService.getUserTags(userid=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tags_76_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving user tags." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
