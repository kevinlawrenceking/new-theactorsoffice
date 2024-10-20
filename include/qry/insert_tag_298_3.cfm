
<cftry>
    <cfset tagsUserService = new "/services/TagsUserService.cfc"()>
    <cfset tagsUserService.inserttags_user(userid=userid, tagname=left(new_valuetext, 40), IsCustom=1)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in insert_tag_298_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
