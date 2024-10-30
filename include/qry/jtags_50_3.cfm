
<cftry>
    <cfset tagsUserService = createObject("component", "services.TagsUserService")>
    <cfset jtags = tagsUserService.SELtags_user_23804(userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in jtags_50_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
