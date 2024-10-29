
<cftry>
    <cfset tagsUserService = createObject("component", "services.TagsUserService")>
    <cfset y = tagsUserService.getUserTags(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in y_298_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
