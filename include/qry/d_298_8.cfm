
<cftry>
    <cfset tagsUserService = new "/services/TagsUserService.cfc"()>
    <cfset tagsUserService.UPDtags_user(userid=userid, tagname=left(y.tagname, 40))>
    <cfcatch>
        <cflog file="errorLog" text="[Error in d_298_8.cfm]: #cfcatch.message#">
        <cfthrow message="Function call failed" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
