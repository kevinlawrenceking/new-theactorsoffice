
<cftry>
    <cfset tagsUserService = createObject("component", "services.TagsUserService")>
    <cfset find = tagsUserService.SELtags_user_24324(new_valuetext=new_valuetext, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_298_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
