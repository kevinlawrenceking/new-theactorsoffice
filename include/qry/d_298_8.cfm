
<cftry>
    <cfset tagsUserService = createObject("component", "services.TagsUserService")>
    <cfset tagsUserService.updateTagsUserTbl(userid=userid, tagname=left(y.tagname, 40))>
    <cfcatch>
        <cflog file="errorLog" text="[Error in d_298_8.cfm]: #cfcatch.message#">
        <cfthrow message="Function call failed" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
