
<cftry>
    <cfset tagsUserService = createObject("component", "/services/TagsUserService")>
    <cfset tagsUserService.INStags_user(userid=userid, new_valuetext=new_valuetext)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_tag_298_3.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
