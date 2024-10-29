
<cftry>
    <cfset tagsUserService = createObject("component", "/services/TagsUserService")>
    <cfset tags = tagsUserService.getTagsUser(userid=userid, tagtypes=tagtypes)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tags_200_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching tags." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
