
<cftry>
    <cfset tagsUserService = new "/services/TagsUserService.cfc"()>
    <cfset find = tagsUserService.gettags_user(
        tagname = left(new_valuetext, 40),
        userid = userid
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_298_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
