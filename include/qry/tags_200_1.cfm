
<cftry>
    <cfset tagsUserService = createObject("component", "/services/TagsUserService")>
    <cfset tags = tagsUserService.SELtags_user_24047(userid=userid, tagtypes=tagtypes)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tags_200_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving tags." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
